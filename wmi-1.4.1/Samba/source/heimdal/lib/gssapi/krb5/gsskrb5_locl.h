/*
 * Copyright (c) 1997 - 2006 Kungliga Tekniska H?gskolan
 * (Royal Institute of Technology, Stockholm, Sweden). 
 * All rights reserved. 
 *
 * Redistribution and use in source and binary forms, with or without 
 * modification, are permitted provided that the following conditions 
 * are met: 
 *
 * 1. Redistributions of source code must retain the above copyright 
 *    notice, this list of conditions and the following disclaimer. 
 *
 * 2. Redistributions in binary form must reproduce the above copyright 
 *    notice, this list of conditions and the following disclaimer in the 
 *    documentation and/or other materials provided with the distribution. 
 *
 * 3. Neither the name of the Institute nor the names of its contributors 
 *    may be used to endorse or promote products derived from this software 
 *    without specific prior written permission. 
 *
 * THIS SOFTWARE IS PROVIDED BY THE INSTITUTE AND CONTRIBUTORS ``AS IS'' AND 
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE 
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE INSTITUTE OR CONTRIBUTORS BE LIABLE 
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL 
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS 
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) 
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT 
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY 
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF 
 * SUCH DAMAGE. 
 */

/* $Id: gsskrb5_locl.h,v 1.8 2006/11/10 00:36:40 lha Exp $ */

#ifndef GSSKRB5_LOCL_H
#define GSSKRB5_LOCL_H

#ifdef HAVE_CONFIG_H
#include <config.h>
#endif

#include <krb5_locl.h>
#include <gkrb5_err.h>
#include <gssapi.h>
#include <gssapi_mech.h>
#include <assert.h>

#include "cfx.h"

/*
 *
 */

struct gss_msg_order;

typedef struct {
  struct krb5_auth_context_data *auth_context;
  krb5_principal source, target;
#define IS_DCE_STYLE(ctx) (((ctx)->flags & GSS_C_DCE_STYLE) != 0)
  OM_uint32 flags;
  enum { LOCAL = 1, OPEN = 2, 
	 COMPAT_OLD_DES3 = 4,
         COMPAT_OLD_DES3_SELECTED = 8,
	 ACCEPTOR_SUBKEY = 16
  } more_flags;
  enum gss_ctx_id_t_state {
      /* initiator states */
      INITIATOR_START,
      INITIATOR_WAIT_FOR_MUTAL,
      INITIATOR_READY,
      /* acceptor states */
      ACCEPTOR_START,
      ACCEPTOR_WAIT_FOR_DCESTYLE,
      ACCEPTOR_READY
  } state;
  struct krb5_ticket *ticket;
  OM_uint32 lifetime;
  HEIMDAL_MUTEX ctx_id_mutex;
  struct gss_msg_order *order;
  krb5_keyblock *service_keyblock;
  krb5_data fwd_data;
} *gsskrb5_ctx;

typedef struct {
  krb5_principal principal;
  int cred_flags;
#define GSS_CF_DESTROY_CRED_ON_RELEASE	1
  struct krb5_keytab_data *keytab;
  OM_uint32 lifetime;
  gss_cred_usage_t usage;
  gss_OID_set mechanisms;
  struct krb5_ccache_data *ccache;
  HEIMDAL_MUTEX cred_id_mutex;
} *gsskrb5_cred;

typedef struct Principal *gsskrb5_name;

/*
 *
 */

extern krb5_context _gsskrb5_context;

extern krb5_keytab _gsskrb5_keytab;
extern HEIMDAL_MUTEX gssapi_keytab_mutex;

struct gssapi_thr_context {
    HEIMDAL_MUTEX mutex;
    char *error_string;
};

/*
 * Prototypes
 */

#include <krb5/gsskrb5-private.h>

#define GSSAPI_KRB5_INIT() do {					\
    krb5_error_code kret_gss_init;				\
    if((kret_gss_init = _gsskrb5_init ()) != 0) {		\
	*minor_status = kret_gss_init;				\
	return GSS_S_FAILURE;					\
    }								\
} while (0)

/* sec_context flags */

#define SC_LOCAL_ADDRESS  0x01
#define SC_REMOTE_ADDRESS 0x02
#define SC_KEYBLOCK	  0x04
#define SC_LOCAL_SUBKEY	  0x08
#define SC_REMOTE_SUBKEY  0x10

#endif
