/*
 * vtunerc: Internal defines
 *
 * Copyright (C) 2010-11 Honza Petrous <jpetrous@smartimp.cz>
 * [Created 2010-03-23]
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

#ifndef _VTUNERC_PRIV_H
#define _VTUNERC_PRIV_H

#include <linux/module.h>	/* Specifically, a module */
#include <linux/kernel.h>	/* We're doing kernel work */
#include <linux/cdev.h>
#include <linux/version.h>

#include <media/demux.h>
#include <media/dmxdev.h>
#include <media/dvb_demux.h>
#include <media/dvb_frontend.h>
#include <media/dvb_net.h>
#include <media/dvbdev.h>

#include "vtuner.h"

#define MAX_PIDTAB_LEN 30

#define PID_UNKNOWN 0x0FFFF

#define MAX_NUM_VTUNER_MODES 3

struct vtunerc_config {

	int debug;
	int tscheck;
	int devices;
};

struct vtunerc_ctx {

	/* DVB api */
	struct dmx_frontend hw_frontend;
	struct dmx_frontend mem_frontend;
	struct dmxdev dmxdev;
	struct dmxdev dmxdev1;
	struct dmxdev dmxdev2;
	struct dvb_adapter dvb_adapter;
	struct dvb_demux demux;
	struct dvb_frontend *fe;
	struct dvb_net dvbnet;
	struct dvb_device *ca;

	/* internals */
	int idx;
	char *name;
	u8 vtype;
	struct dvb_frontend_info *feinfo;
	struct vtunerc_config *config;

	unsigned short pidtab[MAX_PIDTAB_LEN];

	struct semaphore xchange_sem;
	struct semaphore ioctl_sem;
	struct semaphore tswrite_sem;
	int fd_opened;
	int closing;

	char *procname;

	char *kernel_buf;
	ssize_t kernel_buf_size;

	/* ctrldev */
	char trail[188];
	unsigned int trailsize;
	int noresponse;
	int num_modes;
	char *ctypes[MAX_NUM_VTUNER_MODES];
	struct vtuner_message ctrldev_request;
	struct vtuner_message ctrldev_response;
	wait_queue_head_t ctrldev_wait_request_wq;
	wait_queue_head_t ctrldev_wait_response_wq;

	/* proc statistics */
	unsigned int stat_wr_data;
	unsigned int stat_rd_data;
	unsigned int stat_ctrl_sess;
	unsigned short pidstat[MAX_PIDTAB_LEN];
};

int vtunerc_register_ctrldev(struct vtunerc_ctx *ctx);
void vtunerc_unregister_ctrldev(struct vtunerc_config *config);
struct vtunerc_ctx *vtunerc_get_ctx(int minor);
int /*__devinit*/ vtunerc_frontend_init(struct vtunerc_ctx *ctx, int vtype);
int /*__devinit*/ vtunerc_frontend_clear(struct vtunerc_ctx *ctx);
int vtunerc_ctrldev_xchange_message(struct vtunerc_ctx *ctx,
					struct vtuner_message *msg,
					int wait4response);
#define dprintk(ctx, fmt, arg...) do {					\
if (ctx->config && (ctx->config->debug))				\
	printk(KERN_DEBUG "vtunerc%d: " fmt, ctx->idx, ##arg);	\
} while (0)

/* backward compatibility stuff */
#if LINUX_VERSION_CODE < KERNEL_VERSION(3,10,0)
static inline void *PDE_DATA(const struct inode *inode)
{
	return PROC_I(inode)->pde->data;
}
#endif

#endif
