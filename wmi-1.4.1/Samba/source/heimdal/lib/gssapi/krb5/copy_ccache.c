/*
 * Copyright (c) 2000 - 2001, 2003 Kungliga Tekniska H?gskolan
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

#include "krb5/gsskrb5_locl.h"

RCSID("$Id: copy_ccache.c,v 1.16 2006/11/08 02:42:50 lha Exp $");

#if 0
OM_uint32
gss_krb5_copy_ccache(OM_uint32 *minor_status,
		     gss_cred_id_t cred,
		     krb5_ccache out)
{
    krb5_error_code kret;

    HEIMDAL_MUTEX_lock(&cred->cred_id_mutex);

    if (cred->ccache == NULL) {
	HEIMDAL_MUTEX_unlock(&cred->cred_id_mutex);
	*minor_status = EINVAL;
	return GSS_S_FAILURE;
    }

    kret = krb5_cc_copy_cache(_gsskrb5_context, cred->ccache, out);
    HEIMDAL_MUTEX_unlock(&cred->cred_id_mutex);
    if (kret) {
	*minor_status = kret;
	_gsskrb5_set_error_string ();
	return GSS_S_FAILURE;
    }
    *minor_status = 0;
    return GSS_S_COMPLETE;
}
#endif


OM_uint32
_gsskrb5_import_cred(OM_uint32 *minor_status,
		     krb5_ccache id,
		     krb5_principal keytab_principal,
		     krb5_keytab keytab,
		     gss_cred_id_t *cred)
{
    krb5_error_code kret;
    gsskrb5_cred handle;
    OM_uint32 ret;

    *cred = NULL;

    GSSAPI_KRB5_INIT ();

    handle = calloc(1, sizeof(*handle));
    if (handle == NULL) {
	_gsskrb5_clear_status ();
	*minor_status = ENOMEM;
        return (GSS_S_FAILURE);
    }
    HEIMDAL_MUTEX_init(&handle->cred_id_mutex);

    handle->usage = 0;

    if (id) {
	char *str;

	handle->usage |= GSS_C_INITIATE;

	kret = krb5_cc_get_principal(_gsskrb5_context, id,
				     &handle->principal);
	if (kret) {
	    free(handle);
	    _gsskrb5_set_error_string ();
	    *minor_status = kret;
	    return GSS_S_FAILURE;
	}
	
	if (keytab_principal) {
	    krb5_boolean match;

	    match = krb5_principal_compare(_gsskrb5_context,
					   handle->principal,
					   keytab_principal);
	    if (match == FALSE) {
		krb5_free_principal(_gsskrb5_context, handle->principal);
		free(handle);
		_gsskrb5_clear_status ();
		*minor_status = EINVAL;
		return GSS_S_FAILURE;
	    }
	}

	ret = __gsskrb5_ccache_lifetime(minor_status,
					   id,
					   handle->principal,
					   &handle->lifetime);
	if (ret != GSS_S_COMPLETE) {
	    krb5_free_principal(_gsskrb5_context, handle->principal);
	    free(handle);
	    return ret;
	}


	kret = krb5_cc_get_full_name(_gsskrb5_context, id, &str);
	if (kret)
	    goto out;

	kret = krb5_cc_resolve(_gsskrb5_context, str, &handle->ccache);
	free(str);
	if (kret)
	    goto out;
    }


    if (keytab) {
	char *str;

	handle->usage |= GSS_C_ACCEPT;

	if (keytab_principal && handle->principal == NULL) {
	    kret = krb5_copy_principal(_gsskrb5_context, 
				       keytab_principal, 
				       &handle->principal);
	    if (kret)
		goto out;
	}

	kret = krb5_kt_get_full_name(_gsskrb5_context, keytab, &str);
	if (kret)
	    goto out;

	kret = krb5_kt_resolve(_gsskrb5_context, str, &handle->keytab);
	free(str);
	if (kret)
	    goto out;
    }


    if (id || keytab) {
	ret = _gsskrb5_create_empty_oid_set(minor_status, &handle->mechanisms);
	if (ret == GSS_S_COMPLETE)
	    ret = _gsskrb5_add_oid_set_member(minor_status, GSS_KRB5_MECHANISM,
					      &handle->mechanisms);
	if (ret != GSS_S_COMPLETE) {
	    kret = *minor_status;
	    goto out;
	}
    }

    *minor_status = 0;
    *cred = (gss_cred_id_t)handle;
    return GSS_S_COMPLETE;

out:
    _gsskrb5_set_error_string ();
    if (handle->principal)
	krb5_free_principal(_gsskrb5_context, handle->principal);
    HEIMDAL_MUTEX_destroy(&handle->cred_id_mutex);
    free(handle);
    *minor_status = kret;
    return GSS_S_FAILURE;
}
