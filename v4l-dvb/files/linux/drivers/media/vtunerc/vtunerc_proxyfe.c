/*
 * vtunerc: Driver for Proxy Frontend
 *
 * Copyright (C) 2010-12 Honza Petrous <jpetrous@smartimp.cz>
 * [Inspired on proxy frontend by Emard <emard@softhome.net>]
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

#include <linux/module.h>
#include <linux/init.h>
#include <linux/string.h>
#include <linux/slab.h>

#include <media/dvb_frontend.h>

#include "vtunerc_priv.h"

#if (DVB_API_VERSION << 8 | DVB_API_VERSION_MINOR) < 0x0505
#error ========================================================================
#error Version 5.5 or newer of DVB API is required (see at linux/dvb/version.h)
#error You can find it in kernel version >= 3.3.0
#error ========================================================================
#endif

struct dvb_proxyfe_state {
	struct dvb_frontend frontend;
	struct vtunerc_ctx *ctx;
};


static int dvb_proxyfe_read_status(struct dvb_frontend *fe, enum fe_status *status)
{
	struct dvb_proxyfe_state *state = fe->demodulator_priv;
	struct vtunerc_ctx *ctx = state->ctx;
	struct vtuner_message msg;

	msg.type = MSG_READ_STATUS;
	vtunerc_ctrldev_xchange_message(ctx, &msg, 1);

	*status = msg.body.status;

	return 0;
}

static int dvb_proxyfe_read_ber(struct dvb_frontend *fe, u32 *ber)
{
	struct dvb_proxyfe_state *state = fe->demodulator_priv;
	struct vtunerc_ctx *ctx = state->ctx;
	struct vtuner_message msg;

	msg.type = MSG_READ_BER;
	vtunerc_ctrldev_xchange_message(ctx, &msg, 1);

	*ber = msg.body.ber;

	return 0;
}

static int dvb_proxyfe_read_signal_strength(struct dvb_frontend *fe,
						u16 *strength)
{
	struct dvb_proxyfe_state *state = fe->demodulator_priv;
	struct vtunerc_ctx *ctx = state->ctx;
	struct vtuner_message msg;

	msg.type = MSG_READ_SIGNAL_STRENGTH;
	vtunerc_ctrldev_xchange_message(ctx, &msg, 1);

	*strength = msg.body.ss;

	return 0;
}

static int dvb_proxyfe_read_snr(struct dvb_frontend *fe, u16 *snr)
{
	struct dvb_proxyfe_state *state = fe->demodulator_priv;
	struct vtunerc_ctx *ctx = state->ctx;
	struct vtuner_message msg;

	msg.type = MSG_READ_SNR;
	vtunerc_ctrldev_xchange_message(ctx, &msg, 1);

	*snr = msg.body.snr;

	return 0;
}

static int dvb_proxyfe_read_ucblocks(struct dvb_frontend *fe, u32 *ucblocks)
{
	struct dvb_proxyfe_state *state = fe->demodulator_priv;
	struct vtunerc_ctx *ctx = state->ctx;
	struct vtuner_message msg;

	msg.type = MSG_READ_UCBLOCKS;
	vtunerc_ctrldev_xchange_message(ctx, &msg, 1);

	*ucblocks = msg.body.ucb;

	return 0;
}

static int dvb_proxyfe_get_frontend(struct dvb_frontend *fe,
					struct dtv_frontend_properties *c)
{
	struct dvb_proxyfe_state *state = fe->demodulator_priv;
	struct vtunerc_ctx *ctx = state->ctx;
	struct vtuner_message msg;

	msg.type = MSG_GET_FRONTEND;
	vtunerc_ctrldev_xchange_message(ctx, &msg, 1);

	switch (ctx->vtype) {
	case VT_S:
	case VT_S2:
		/*FIXME*/
		{
			c->symbol_rate = msg.body.fe_params.u.qpsk.symbol_rate;
			c->fec_inner = msg.body.fe_params.u.qpsk.fec_inner;
		}
		break;
	case VT_T:
		{
			c->bandwidth_hz = msg.body.fe_params.u.ofdm.bandwidth;
			c->code_rate_HP = msg.body.fe_params.u.ofdm.code_rate_HP;
			c->code_rate_LP = msg.body.fe_params.u.ofdm.code_rate_LP;
			c->modulation = msg.body.fe_params.u.ofdm.constellation;
			c->transmission_mode = msg.body.fe_params.u.ofdm.transmission_mode;
			c->guard_interval = msg.body.fe_params.u.ofdm.guard_interval;
			c->hierarchy = msg.body.fe_params.u.ofdm.hierarchy_information;
		}
		break;
	case VT_C:
		/* FIXME: untested */
		{
			c->symbol_rate = msg.body.fe_params.u.qam.symbol_rate;
			c->fec_inner = msg.body.fe_params.u.qam.fec_inner;
			c->modulation = msg.body.fe_params.u.qam.modulation;
		}
		break;
	default:
		printk(KERN_ERR "vtunerc%d: unregognized tuner vtype = %d\n", ctx->idx,
				ctx->vtype);
		return -EINVAL;
	}
	c->frequency = msg.body.fe_params.frequency;
	c->inversion = msg.body.fe_params.inversion;
	return 0;
}

static int dvb_proxyfe_set_frontend(struct dvb_frontend *fe)
{
	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
	struct dvb_proxyfe_state *state = fe->demodulator_priv;
	struct vtunerc_ctx *ctx = state->ctx;
	struct vtuner_message msg;

	memset(&msg, 0, sizeof(msg));
	msg.body.fe_params.frequency = c->frequency;
	msg.body.fe_params.inversion = c->inversion;

	switch (ctx->vtype) {
	case VT_S:
	case VT_S2:
		msg.body.fe_params.u.qpsk.symbol_rate = c->symbol_rate;
		msg.body.fe_params.u.qpsk.fec_inner = c->fec_inner;

		if (ctx->vtype == VT_S2 && c->delivery_system == SYS_DVBS2) {
			/* DELIVERY SYSTEM: S2 delsys in use */
			msg.body.fe_params.u.qpsk.fec_inner |= 32;

			/* MODULATION */
			if (c->modulation == PSK_8)
			  /* signal PSK_8 modulation used */
			  msg.body.fe_params.u.qpsk.fec_inner |= 64;

			/* ROLLOFF */
			switch (c->rolloff) {
			case ROLLOFF_20:
				msg.body.fe_params.inversion |= 0x08;
				break;
			case ROLLOFF_25:
				msg.body.fe_params.inversion |= 0x04;
				break;
			case ROLLOFF_35:
			default:
				break;
			}

			/* PILOT */
			switch (c->pilot) {
			case PILOT_ON:
				msg.body.fe_params.inversion |= 0x10;
				break;
			case PILOT_AUTO:
				msg.body.fe_params.inversion |= 0x20;
				break;
			case PILOT_OFF:
			default:
				break;
			}
		}
		break;
	case VT_T:
		msg.body.fe_params.u.ofdm.bandwidth = c->bandwidth_hz;
		msg.body.fe_params.u.ofdm.code_rate_HP = c->code_rate_HP;
		msg.body.fe_params.u.ofdm.code_rate_LP = c->code_rate_LP;
		msg.body.fe_params.u.ofdm.constellation = c->modulation;
		msg.body.fe_params.u.ofdm.transmission_mode = c->transmission_mode;
		msg.body.fe_params.u.ofdm.guard_interval = c->guard_interval;
		msg.body.fe_params.u.ofdm.hierarchy_information = c->hierarchy;
		break;
	case VT_C:
		msg.body.fe_params.u.qam.symbol_rate = c->symbol_rate;
		msg.body.fe_params.u.qam.fec_inner = c->fec_inner;
		msg.body.fe_params.u.qam.modulation = c->modulation;
		break;
	default:
		printk(KERN_ERR "vtunerc%d: unregognized tuner vtype = %d\n",
				ctx->idx, ctx->vtype);
		return -EINVAL;
	}

	msg.type = MSG_SET_FRONTEND;
	vtunerc_ctrldev_xchange_message(ctx, &msg, 1);

	return 0;
}

static enum dvbfe_algo dvb_proxyfe_get_frontend_algo(struct dvb_frontend *fe)
{
	return DVBFE_ALGO_SW;
}

static int dvb_proxyfe_sleep(struct dvb_frontend *fe)
{
	return 0;
}

static int dvb_proxyfe_init(struct dvb_frontend *fe)
{
	return 0;
}

static int dvb_proxyfe_set_tone(struct dvb_frontend *fe, enum fe_sec_tone_mode tone)
{
	struct dvb_proxyfe_state *state = fe->demodulator_priv;
	struct vtunerc_ctx *ctx = state->ctx;
	struct vtuner_message msg;

	msg.body.tone = tone;
	msg.type = MSG_SET_TONE;
	vtunerc_ctrldev_xchange_message(ctx, &msg, 1);

	return 0;
}

static int dvb_proxyfe_set_voltage(struct dvb_frontend *fe, enum fe_sec_voltage voltage)
{
	struct dvb_proxyfe_state *state = fe->demodulator_priv;
	struct vtunerc_ctx *ctx = state->ctx;
	struct vtuner_message msg;

	msg.body.voltage = voltage;
	msg.type = MSG_SET_VOLTAGE;
	vtunerc_ctrldev_xchange_message(ctx, &msg, 1);

	return 0;
}

static int dvb_proxyfe_send_diseqc_msg(struct dvb_frontend *fe, struct dvb_diseqc_master_cmd *cmd)
{
	struct dvb_proxyfe_state *state = fe->demodulator_priv;
	struct vtunerc_ctx *ctx = state->ctx;
	struct vtuner_message msg;

	memcpy(&msg.body.diseqc_master_cmd, cmd, sizeof(struct dvb_diseqc_master_cmd));
	msg.type = MSG_SEND_DISEQC_MSG;
	vtunerc_ctrldev_xchange_message(ctx, &msg, 1);

	return 0;
}

static int dvb_proxyfe_send_diseqc_burst(struct dvb_frontend *fe, enum fe_sec_mini_cmd burst)
{
	struct dvb_proxyfe_state *state = fe->demodulator_priv;
	struct vtunerc_ctx *ctx = state->ctx;
	struct vtuner_message msg;

	msg.body.burst = burst;
	msg.type = MSG_SEND_DISEQC_BURST;
	vtunerc_ctrldev_xchange_message(ctx, &msg, 1);

	return 0;
}

static void dvb_proxyfe_release(struct dvb_frontend *fe)
{
	struct dvb_proxyfe_state *state = fe->demodulator_priv;

	kfree(state);
}

static struct dvb_frontend_ops dvb_proxyfe_ofdm_ops;

static struct dvb_frontend *dvb_proxyfe_ofdm_attach(struct vtunerc_ctx *ctx)
{
	struct dvb_frontend *fe = ctx->fe;

	if (!fe) {
		struct dvb_proxyfe_state *state = NULL;

		/* allocate memory for the internal state */
		state = kmalloc(sizeof(struct dvb_proxyfe_state), GFP_KERNEL);
		if (state == NULL) {
			return NULL;
		}

		fe = &state->frontend;
		fe->demodulator_priv = state;
		state->ctx = ctx;
	}

	memcpy(&fe->ops, &dvb_proxyfe_ofdm_ops, sizeof(struct dvb_frontend_ops));

	return fe;
}

static struct dvb_frontend_ops dvb_proxyfe_qpsk_ops;

static struct dvb_frontend *dvb_proxyfe_qpsk_attach(struct vtunerc_ctx *ctx, int can_2g_modulation)
{
	struct dvb_frontend *fe = ctx->fe;

	if (!fe) {
		struct dvb_proxyfe_state *state = NULL;

		/* allocate memory for the internal state */
		state = kmalloc(sizeof(struct dvb_proxyfe_state), GFP_KERNEL);
		if (state == NULL) {
			return NULL;
		}

		fe = &state->frontend;
		fe->demodulator_priv = state;
		state->ctx = ctx;
	}

	memcpy(&fe->ops, &dvb_proxyfe_qpsk_ops, sizeof(struct dvb_frontend_ops));
	if (can_2g_modulation) {
		fe->ops.info.caps |= FE_CAN_2G_MODULATION;
		fe->ops.delsys[1] = SYS_DVBS2;
		strcpy(fe->ops.info.name, "vTuner proxyFE DVB-S2");
	}

	return fe;
}

static struct dvb_frontend_ops dvb_proxyfe_qam_ops;

static struct dvb_frontend *dvb_proxyfe_qam_attach(struct vtunerc_ctx *ctx)
{
	struct dvb_frontend *fe = ctx->fe;

	if (!fe) {
		struct dvb_proxyfe_state *state = NULL;

		/* allocate memory for the internal state */
		state = kmalloc(sizeof(struct dvb_proxyfe_state), GFP_KERNEL);
		if (state == NULL) {
			return NULL;
		}

		fe = &state->frontend;
		fe->demodulator_priv = state;
		state->ctx = ctx;
	}

	memcpy(&fe->ops, &dvb_proxyfe_qam_ops, sizeof(struct dvb_frontend_ops));

	return fe;
}

static struct dvb_frontend_ops dvb_proxyfe_ofdm_ops = {
	.delsys = { SYS_DVBT },
	.info = {
		.name			= "vTuner proxyFE DVB-T",
		.frequency_min_hz	=     51 * MHz,
		.frequency_max_hz	= 863250 * kHz,
		.frequency_stepsize_hz	= 62500,
		.caps = FE_CAN_FEC_1_2 | FE_CAN_FEC_2_3 | FE_CAN_FEC_3_4 |
				FE_CAN_FEC_4_5 | FE_CAN_FEC_5_6 | FE_CAN_FEC_6_7 |
				FE_CAN_FEC_7_8 | FE_CAN_FEC_8_9 | FE_CAN_FEC_AUTO |
				FE_CAN_QAM_16 | FE_CAN_QAM_64 | FE_CAN_QAM_AUTO |
				FE_CAN_TRANSMISSION_MODE_AUTO |
				FE_CAN_GUARD_INTERVAL_AUTO |
				FE_CAN_HIERARCHY_AUTO,
	},

	.release = dvb_proxyfe_release,

	.init = dvb_proxyfe_init,
	.sleep = dvb_proxyfe_sleep,

	.set_frontend = dvb_proxyfe_set_frontend,
	.get_frontend = dvb_proxyfe_get_frontend,

	.read_status = dvb_proxyfe_read_status,
	.read_ber = dvb_proxyfe_read_ber,
	.read_signal_strength = dvb_proxyfe_read_signal_strength,
	.read_snr = dvb_proxyfe_read_snr,
	.read_ucblocks = dvb_proxyfe_read_ucblocks,
};

static struct dvb_frontend_ops dvb_proxyfe_qam_ops = {
	.delsys = { SYS_DVBC_ANNEX_A },
	.info = {
		.name			= "vTuner proxyFE DVB-C",
		.frequency_stepsize_hz	= 62500,
		.frequency_min_hz	=  51 * MHz,
		.frequency_max_hz	= 858 * MHz,
		.symbol_rate_min	= (57840000/2)/64,     /* SACLK/64 == (XIN/2)/64 */
		.symbol_rate_max	= (57840000/2)/4,      /* SACLK/4 */
		.caps = FE_CAN_QAM_16 | FE_CAN_QAM_32 | FE_CAN_QAM_64 |
			FE_CAN_QAM_128 | FE_CAN_QAM_256 |
			FE_CAN_FEC_AUTO | FE_CAN_INVERSION_AUTO
	},

	.release = dvb_proxyfe_release,

	.init = dvb_proxyfe_init,
	.sleep = dvb_proxyfe_sleep,

	.set_frontend = dvb_proxyfe_set_frontend,
	.get_frontend = dvb_proxyfe_get_frontend,

	.read_status = dvb_proxyfe_read_status,
	.read_ber = dvb_proxyfe_read_ber,
	.read_signal_strength = dvb_proxyfe_read_signal_strength,
	.read_snr = dvb_proxyfe_read_snr,
	.read_ucblocks = dvb_proxyfe_read_ucblocks,
};

static struct dvb_frontend_ops dvb_proxyfe_qpsk_ops = {
	.delsys = { SYS_DVBS },
	.info = {
		.name			= "vTuner proxyFE DVB-S",
		.frequency_min_hz	=  950 * MHz,
		.frequency_max_hz	= 2150 * MHz,
		.frequency_stepsize_hz	= 250 * kHz,           /* kHz for QPSK frontends */
		.frequency_tolerance_hz	= 29500 * kHz,
		.symbol_rate_min	= 1000000,
		.symbol_rate_max	= 45000000,
		.caps = FE_CAN_INVERSION_AUTO | FE_CAN_FEC_1_2 |
				FE_CAN_FEC_2_3 | FE_CAN_FEC_3_4 | FE_CAN_FEC_4_5 |
				FE_CAN_FEC_5_6 | FE_CAN_FEC_7_8 | FE_CAN_FEC_8_9 |
				FE_CAN_QPSK | FE_CAN_RECOVER
	},

	.release = dvb_proxyfe_release,

	.init = dvb_proxyfe_init,
	.sleep = dvb_proxyfe_sleep,

	.get_frontend = dvb_proxyfe_get_frontend,
	.get_frontend_algo = dvb_proxyfe_get_frontend_algo,
	.set_frontend = dvb_proxyfe_set_frontend,

	.read_status = dvb_proxyfe_read_status,
	.read_ber = dvb_proxyfe_read_ber,
	.read_signal_strength = dvb_proxyfe_read_signal_strength,
	.read_snr = dvb_proxyfe_read_snr,
	.read_ucblocks = dvb_proxyfe_read_ucblocks,

	.set_voltage = dvb_proxyfe_set_voltage,
	.set_tone = dvb_proxyfe_set_tone,

	.diseqc_send_master_cmd         = dvb_proxyfe_send_diseqc_msg,
	.diseqc_send_burst              = dvb_proxyfe_send_diseqc_burst,

};

int /*__devinit*/ vtunerc_frontend_init(struct vtunerc_ctx *ctx, int vtype)
{
	int ret = 0;

	if (ctx->fe && vtype == ctx->vtype) {
		printk(KERN_NOTICE "vtunerc%d: frontend already initialized as type=%d\n",
				ctx->idx, ctx->vtype);
		return 0;
	}

	switch (vtype) {
	case VT_S:
		ctx->fe = dvb_proxyfe_qpsk_attach(ctx, 0);
		break;
	case VT_S2:
		ctx->fe = dvb_proxyfe_qpsk_attach(ctx, 1);
		break;
	case VT_T:
		ctx->fe = dvb_proxyfe_ofdm_attach(ctx);
		break;
	case VT_C:
		ctx->fe = dvb_proxyfe_qam_attach(ctx);
		break;
	default:
		printk(KERN_ERR "vtunerc%d: unregognized tuner vtype = %d\n",
				ctx->idx, ctx->vtype);
		return -EINVAL;
	}

	if(ctx->vtype == VT_NULL) // means: was frontend not registered yet?
		ret = dvb_register_frontend(&ctx->dvb_adapter, ctx->fe);

	ctx->vtype = vtype;

	return ret;
}

int /*__devinit*/ vtunerc_frontend_clear(struct vtunerc_ctx *ctx)
{
	return ctx->fe ? dvb_unregister_frontend(ctx->fe) : 0;
}
