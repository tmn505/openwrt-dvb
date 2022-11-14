/*
 * vtunerc: Virtual adapter driver
 *
 * Copyright (C) 2010-12 Honza Petrous <jpetrous@smartimp.cz>
 * [Created 2010-03-23]
 * Sponsored by Smartimp s.r.o. for its NessieDVB.com box
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation version 2.
 *
 * This program is distributed WITHOUT ANY WARRANTY of any
 * kind, whether express or implied; without even the implied warranty
 * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

#include <linux/module.h>	/* Specifically, a module */
#include <linux/kernel.h>	/* We're doing kernel work */
#include <linux/proc_fs.h>
#include <linux/init.h>
#include <linux/i2c.h>
#include <linux/uaccess.h>
#include <linux/delay.h>
#include <linux/seq_file.h>

#include <media/demux.h>
#include <media/dmxdev.h>
#include <media/dvb_demux.h>
#include <media/dvb_frontend.h>
#include <media/dvb_net.h>
#include <media/dvbdev.h>

#include "vtunerc_priv.h"

#define VTUNERC_MODULE_VERSION "1.4"

DVB_DEFINE_MOD_OPT_ADAPTER_NR(adapter_nr);

#define DRIVER_NAME		"vTuner proxy"

#define VTUNERC_PROC_FILENAME	"vtunerc%i"

#ifndef VTUNERC_MAX_ADAPTERS
#define VTUNERC_MAX_ADAPTERS	4
#endif

static struct vtunerc_ctx *vtunerc_tbl[VTUNERC_MAX_ADAPTERS] = { NULL };

/* module params */
static struct vtunerc_config config = {
	.devices = 1,
	.tscheck = 0,
	.debug = 0
};

static int pidtab_find_index(unsigned short *pidtab, int pid)
{
	int i = 0;

	while (i < MAX_PIDTAB_LEN) {
		if (pidtab[i] == pid)
			return i;
		i++;
	}

	return -1;
}

static int pidtab_add_pid(unsigned short *pidtab, int pid)
{
	int i;

	/* TODO: speed-up hint: add pid sorted */

	for (i = 0; i < MAX_PIDTAB_LEN; i++)
		if (pidtab[i] == PID_UNKNOWN) {
			pidtab[i] = pid;
			return 0;
		}

	return -1;
}

static int pidtab_del_pid(unsigned short *pidtab, int pid)
{
	int i;

	/* TODO: speed-up hint: delete sorted */

	for (i = 0; i < MAX_PIDTAB_LEN; i++)
		if (pidtab[i] == pid) {
			pidtab[i] = PID_UNKNOWN;
			/* TODO: move rest */
			return 0;
		}

	return -1;
}

static void pidtab_copy_to_msg(struct vtunerc_ctx *ctx,
				struct vtuner_message *msg)
{
	int i;

	for (i = 0; i < MAX_PIDTAB_LEN ; i++)
		msg->body.pidlist[i] = ctx->pidtab[i]; /*TODO: optimize it*/
	/* msg->body.pidlist[MAX_PIDTAB_LEN - 1] = 0; */
}

static int vtunerc_start_feed(struct dvb_demux_feed *feed)
{
	struct dvb_demux *demux = feed->demux;
	struct vtunerc_ctx *ctx = demux->priv;
	struct vtuner_message msg;

	switch (feed->type) {
	case DMX_TYPE_TS:
		break;
	case DMX_TYPE_SEC:
		break;
	default:
		printk(KERN_ERR "vtunerc%d: feed type %d is not supported\n",
				ctx->idx, feed->type);
		return -EINVAL;
	}

	if (feed->pid >= 0x2000 ) {
	  printk(KERN_ERR "vtunerc%d: full mux not supported\n",ctx->idx);
	  return -EINVAL;
	}

	/* organize PID list table */
	if (pidtab_find_index(ctx->pidtab, feed->pid) < 0) {
		pidtab_add_pid(ctx->pidtab, feed->pid);

		pidtab_copy_to_msg(ctx, &msg);

		msg.type = MSG_PIDLIST;
		vtunerc_ctrldev_xchange_message(ctx, &msg, 0);
	}

	return 0;
}

static int vtunerc_stop_feed(struct dvb_demux_feed *feed)
{
	struct dvb_demux *demux = feed->demux;
	struct vtunerc_ctx *ctx = demux->priv;
	struct vtuner_message msg;

	/* organize PID list table */

	if (pidtab_find_index(ctx->pidtab, feed->pid) > -1) {
		pidtab_del_pid(ctx->pidtab, feed->pid);

		pidtab_copy_to_msg(ctx, &msg);

		msg.type = MSG_PIDLIST;
		vtunerc_ctrldev_xchange_message(ctx, &msg, 0);
	}

	return 0;
}

/* ----------------------------------------------------------- */


#ifdef CONFIG_PROC_FS

static char *get_fe_name(struct dvb_frontend_info *feinfo)
{
	return (feinfo && feinfo->name) ? feinfo->name : "(not set)";
}

static int vtunerc_read_proc(struct seq_file *seq, void *v)
{
	int i, pcnt = 0;
	struct vtunerc_ctx *ctx = (struct vtunerc_ctx *)seq->private;
		seq_printf(seq, "[ vtunerc driver, version "
					VTUNERC_MODULE_VERSION " ]\n");
		seq_printf(seq, "  sessions: %u\n", ctx->stat_ctrl_sess);
		seq_printf(seq, "  TS data : %u\n", ctx->stat_wr_data);
		seq_printf(seq, "  PID tab :");
		for (i = 0; i < MAX_PIDTAB_LEN; i++)
			if (ctx->pidtab[i] != PID_UNKNOWN) {
			seq_printf(seq, " %x", ctx->pidtab[i]);
			pcnt++;
			}
		seq_printf(seq, " (len=%d)\n", pcnt);
		seq_printf(seq, "  FE type : %s\n", get_fe_name(ctx->feinfo));
		seq_printf(seq, "  msg xchg: %d/%d\n", ctx->ctrldev_request.type, ctx->ctrldev_response.type);
	return 0;
}

static int vtunerc_proc_open(struct inode *inode, struct file *file)
{
	int ret;
	struct vtunerc_ctx *ctx = PDE_DATA(inode);

	if (!try_module_get(THIS_MODULE))
		return -ENODEV;
	ret = single_open(file, vtunerc_read_proc, ctx);
	if (ret)
		module_put(THIS_MODULE);
	return ret;
}

static int vtuner_proc_release(struct inode *inode, struct file *file)
{
	int ret = single_release(inode, file);
	module_put(THIS_MODULE);
	return ret;
}

static const struct file_operations vtunerc_read_proc_fops = {
	.open		= vtunerc_proc_open,
	.read		= seq_read,
	.llseek		= seq_lseek,
	.release	= vtuner_proc_release,
	};

#endif

static char *my_strdup(const char *s)
{
	char *rv = kmalloc(strlen(s)+1, GFP_KERNEL);
	if (rv)
		strcpy(rv, s);
	return rv;
}

struct vtunerc_ctx *vtunerc_get_ctx(int minor)
{
	if (minor >= VTUNERC_MAX_ADAPTERS)
		return NULL;

	return vtunerc_tbl[minor];
}

static int __init vtunerc_init(void)
{
	struct vtunerc_ctx *ctx = NULL;
	struct dvb_demux *dvbdemux;
	struct dmx_demux *dmx;
	int ret = -EINVAL, i, idx;

	printk(KERN_INFO "virtual DVB adapter driver, version "
			VTUNERC_MODULE_VERSION
			", (c) 2010-12 Honza Petrous, SmartImp.cz\n");

	request_module("dvb-core"); /* FIXME: dunno which way it should work :-/ */

	for (idx = 0; idx < config.devices; idx++) {
		ctx = kzalloc(sizeof(struct vtunerc_ctx), GFP_KERNEL);
		if (!ctx) {
			while(idx)
				kfree(vtunerc_tbl[--idx]);
			return -ENOMEM;
		}

		vtunerc_tbl[idx] = ctx;

		ctx->idx = idx;
		ctx->config = &config;
		ctx->ctrldev_request.type = -1;
		ctx->ctrldev_response.type = -1;
		init_waitqueue_head(&ctx->ctrldev_wait_request_wq);
		init_waitqueue_head(&ctx->ctrldev_wait_response_wq);

		// buffer
		ctx->kernel_buf = NULL;
		ctx->kernel_buf_size = 0;

		/* dvb */

		/* create new adapter */
		ret = dvb_register_adapter(&ctx->dvb_adapter, DRIVER_NAME,
					   THIS_MODULE, NULL, adapter_nr);
		if (ret < 0)
			goto err_kfree;

		ctx->dvb_adapter.priv = ctx;

		memset(&ctx->demux, 0, sizeof(ctx->demux));
		dvbdemux = &ctx->demux;
		dvbdemux->priv = ctx;
		dvbdemux->filternum = MAX_PIDTAB_LEN;
		dvbdemux->feednum = MAX_PIDTAB_LEN;
		dvbdemux->start_feed = vtunerc_start_feed;
		dvbdemux->stop_feed = vtunerc_stop_feed;
		dvbdemux->dmx.capabilities = 0;
		ret = dvb_dmx_init(dvbdemux);
		if (ret < 0)
			goto err_dvb_unregister_adapter;

		dmx = &dvbdemux->dmx;

		ctx->hw_frontend.source = DMX_FRONTEND_0;
		ctx->mem_frontend.source = DMX_MEMORY_FE;
		ctx->dmxdev.filternum = MAX_PIDTAB_LEN;
		ctx->dmxdev.demux = dmx;

		ret = dvb_dmxdev_init(&ctx->dmxdev, &ctx->dvb_adapter);
		if (ret < 0)
			goto err_dvb_dmx_release;

		ret = dmx->add_frontend(dmx, &ctx->hw_frontend);
		if (ret < 0)
			goto err_dvb_dmxdev_release;

		ret = dmx->add_frontend(dmx, &ctx->mem_frontend);
		if (ret < 0)
			goto err_remove_hw_frontend;

		ret = dmx->connect_frontend(dmx, &ctx->hw_frontend);
		if (ret < 0)
			goto err_remove_mem_frontend;

		sema_init(&ctx->xchange_sem, 1);
		sema_init(&ctx->ioctl_sem, 1);
		sema_init(&ctx->tswrite_sem, 1);

		/* init pid table */
		for (i = 0; i < MAX_PIDTAB_LEN; i++)
			ctx->pidtab[i] = PID_UNKNOWN;

#ifdef CONFIG_PROC_FS
		{
			char procfilename[64];

			sprintf(procfilename, VTUNERC_PROC_FILENAME,
					ctx->idx);
			ctx->procname = my_strdup(procfilename);
			if (proc_create_data(ctx->procname, 0, NULL,
							&vtunerc_read_proc_fops,
							ctx) == 0)
				printk(KERN_WARNING
					"vtunerc%d: Unable to register '%s' proc file\n",
					ctx->idx, ctx->procname);
		}
#endif
	}

	vtunerc_register_ctrldev(ctx);

out:
	return ret;

	dmx->disconnect_frontend(dmx);
err_remove_mem_frontend:
	dmx->remove_frontend(dmx, &ctx->mem_frontend);
err_remove_hw_frontend:
	dmx->remove_frontend(dmx, &ctx->hw_frontend);
err_dvb_dmxdev_release:
	dvb_dmxdev_release(&ctx->dmxdev);
err_dvb_dmx_release:
	dvb_dmx_release(dvbdemux);
err_dvb_unregister_adapter:
	dvb_unregister_adapter(&ctx->dvb_adapter);
err_kfree:
	kfree(ctx);
	goto out;
}

static void __exit vtunerc_exit(void)
{
	struct dvb_demux *dvbdemux;
	struct dmx_demux *dmx;
	int idx;

	vtunerc_unregister_ctrldev(&config);

	for (idx = 0; idx < config.devices; idx++) {
		struct vtunerc_ctx *ctx = vtunerc_tbl[idx];
		if(!ctx)
			continue;
		vtunerc_tbl[idx] = NULL;
#ifdef CONFIG_PROC_FS
		remove_proc_entry(ctx->procname, NULL);
		kfree(ctx->procname);
#endif

		vtunerc_frontend_clear(ctx);

		dvbdemux = &ctx->demux;
		dmx = &dvbdemux->dmx;

		dmx->disconnect_frontend(dmx);
		dmx->remove_frontend(dmx, &ctx->mem_frontend);
		dmx->remove_frontend(dmx, &ctx->hw_frontend);
		dvb_dmxdev_release(&ctx->dmxdev);
		dvb_dmx_release(dvbdemux);
		dvb_unregister_adapter(&ctx->dvb_adapter);

		// free allocated buffer
		if(ctx->kernel_buf != NULL) {
			kfree(ctx->kernel_buf);
			printk(KERN_INFO "vtunerc%d: deallocated buffer of %zu bytes\n", idx, ctx->kernel_buf_size);
			ctx->kernel_buf = NULL;
			ctx->kernel_buf_size = 0;

		}

		kfree(ctx);
	}

	printk(KERN_NOTICE "vtunerc: unloaded successfully\n");
}

module_init(vtunerc_init);
module_exit(vtunerc_exit);

MODULE_AUTHOR("Honza Petrous");
MODULE_DESCRIPTION("virtual DVB device");
MODULE_LICENSE("GPL");
MODULE_VERSION(VTUNERC_MODULE_VERSION);

module_param_named(devices, config.devices, int, S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP);
MODULE_PARM_DESC(devices, "Number of virtual adapters (default is 1)");

module_param_named(tscheck, config.tscheck, int, S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP);
MODULE_PARM_DESC(tscheck, "Check TS packet validity (default is 0)");

module_param_named(debug, config.debug, int, S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP);
MODULE_PARM_DESC(debug, "Enable debug messages (default is 0)");

