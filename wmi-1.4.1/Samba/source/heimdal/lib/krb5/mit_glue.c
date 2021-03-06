/*
 * Copyright (c) 2003 Kungliga Tekniska H?gskolan
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

#include "krb5_locl.h"
RCSID("$Id: mit_glue.c,v 1.9 2006/11/09 21:24:16 lha Exp $");

/*
 * Glue for MIT API
 */

krb5_error_code KRB5_LIB_FUNCTION
krb5_c_make_checksum(krb5_context context, 
		     krb5_cksumtype cksumtype, 
		     const krb5_keyblock *key, 
		     krb5_keyusage usage,
		     const krb5_data *input, 
		     krb5_checksum *cksum)
{
    krb5_error_code ret;
    krb5_crypto crypto;

    ret = krb5_crypto_init(context, key, 0, &crypto);
    if (ret)
	return ret;

    ret = krb5_create_checksum(context, crypto,  usage, cksumtype,
			       input->data, input->length, cksum);
    krb5_crypto_destroy(context, crypto);

    return ret ;
}

krb5_error_code KRB5_LIB_FUNCTION
krb5_c_verify_checksum(krb5_context context, const krb5_keyblock *key,
		       krb5_keyusage usage, const krb5_data *data,
		       const krb5_checksum *cksum, krb5_boolean *valid)
{
    krb5_error_code ret;
    krb5_checksum data_cksum;

    *valid = 0;

    ret = krb5_c_make_checksum(context, cksum->cksumtype,
			       key, usage, data, &data_cksum);
    if (ret)
	return ret;

    if (data_cksum.cksumtype == cksum->cksumtype
	&& data_cksum.checksum.length == cksum->checksum.length
	&& memcmp(data_cksum.checksum.data, cksum->checksum.data, cksum->checksum.length) == 0)
	*valid = 1;

    krb5_free_checksum_contents(context, &data_cksum);

    return 0;
}

krb5_error_code KRB5_LIB_FUNCTION
krb5_c_get_checksum(krb5_context context, const krb5_checksum *cksum,
		    krb5_cksumtype *type, krb5_data **data)
{
    krb5_error_code ret;

    if (type)
	*type = cksum->cksumtype;
    if (data) {
	*data = malloc(sizeof(**data));
	if (*data == NULL)
	    return ENOMEM;

	ret = der_copy_octet_string(&cksum->checksum, *data);
	if (ret) {
	    free(*data);
	    *data = NULL;
	    return ret;
	}
    }
    return 0;
}

krb5_error_code KRB5_LIB_FUNCTION
krb5_c_set_checksum(krb5_context context, krb5_checksum *cksum,
		    krb5_cksumtype type, const krb5_data *data)
{
    cksum->cksumtype = type;
    return der_copy_octet_string(data, &cksum->checksum);
}

void KRB5_LIB_FUNCTION 
krb5_free_checksum (krb5_context context, krb5_checksum *cksum)
{
    krb5_checksum_free(context, cksum);
    free(cksum);
}

void KRB5_LIB_FUNCTION
krb5_free_checksum_contents(krb5_context context, krb5_checksum *cksum)
{
    krb5_checksum_free(context, cksum);
    memset(cksum, 0, sizeof(*cksum));
}

void KRB5_LIB_FUNCTION
krb5_checksum_free(krb5_context context, krb5_checksum *cksum)
{
    free_Checksum(cksum);
}

krb5_boolean KRB5_LIB_FUNCTION
krb5_c_valid_enctype (krb5_enctype etype)
{
    return krb5_enctype_valid(NULL, etype);
}

krb5_boolean KRB5_LIB_FUNCTION
krb5_c_valid_cksumtype(krb5_cksumtype ctype)
{
    return krb5_cksumtype_valid(NULL, ctype);
}

krb5_boolean KRB5_LIB_FUNCTION
krb5_c_is_coll_proof_cksum(krb5_cksumtype ctype)
{
    return krb5_checksum_is_collision_proof(NULL, ctype);
}

krb5_boolean KRB5_LIB_FUNCTION
krb5_c_is_keyed_cksum(krb5_cksumtype ctype)
{
    return krb5_checksum_is_keyed(NULL, ctype);
}

krb5_error_code KRB5_LIB_FUNCTION
krb5_copy_checksum (krb5_context context,
		    const krb5_checksum *old,
		    krb5_checksum **new)
{
    *new = malloc(sizeof(**new));
    if (*new == NULL)
	return ENOMEM;
    return copy_Checksum(old, *new);
}

krb5_error_code KRB5_LIB_FUNCTION
krb5_c_checksum_length (krb5_context context, krb5_cksumtype cksumtype,
			size_t *length)
{
    return krb5_checksumsize(context, cksumtype, length);
}

krb5_error_code KRB5_LIB_FUNCTION
krb5_c_block_size(krb5_context context, 
		  krb5_enctype enctype, 
		  size_t *blocksize)
{
    krb5_error_code ret;
    krb5_crypto crypto;
    krb5_keyblock key;

    ret = krb5_generate_random_keyblock(context, enctype, &key);
    if (ret)
	return ret;

    ret = krb5_crypto_init(context, &key, 0, &crypto);
    krb5_free_keyblock_contents(context, &key);
    if (ret)
	return ret;
    ret = krb5_crypto_getblocksize(context, crypto, blocksize);
    krb5_crypto_destroy(context, crypto);

    return ret;
}

krb5_error_code KRB5_LIB_FUNCTION
krb5_c_decrypt(krb5_context context, 
	       const krb5_keyblock key, 
	       krb5_keyusage usage, 
	       const krb5_data *ivec, 
	       krb5_enc_data *input, 
	       krb5_data *output)
{
    krb5_error_code ret;
    krb5_crypto crypto;

    ret = krb5_crypto_init(context, &key, input->enctype, &crypto);
    if (ret)
	return ret;

    if (ivec) {
	size_t blocksize;

	ret = krb5_crypto_getblocksize(context, crypto, &blocksize);
	if (ret) {
	krb5_crypto_destroy(context, crypto);
	return ret;
	}
	
	if (blocksize > ivec->length) {
	    krb5_crypto_destroy(context, crypto);
	    return KRB5_BAD_MSIZE;
	}
    }

    ret = krb5_decrypt_ivec(context, crypto, usage, 
			    input->ciphertext.data, input->ciphertext.length, 
			    output, 
			    ivec ? ivec->data : NULL);

    krb5_crypto_destroy(context, crypto);

    return ret ;
}

krb5_error_code KRB5_LIB_FUNCTION
krb5_c_encrypt(krb5_context context, 
	       const krb5_keyblock *key, 
	       krb5_keyusage usage,
	       const krb5_data *ivec, 
	       const krb5_data *input,
	       krb5_enc_data *output)
{
    krb5_error_code ret;
    krb5_crypto crypto;

    ret = krb5_crypto_init(context, key, 0, &crypto);
    if (ret)
	return ret;

    if (ivec) {
	size_t blocksize;

	ret = krb5_crypto_getblocksize(context, crypto, &blocksize);
	if (ret) {
	    krb5_crypto_destroy(context, crypto);
	    return ret;
	}

	if (blocksize > ivec->length) {
	    krb5_crypto_destroy(context, crypto);
	    return KRB5_BAD_MSIZE;
	}
    }

    ret = krb5_encrypt_ivec(context, crypto, usage, 
			    input->data, input->length, 
			    &output->ciphertext, 
			    ivec ? ivec->data : NULL);
    output->kvno = 0;
    krb5_crypto_getenctype(context, crypto, &output->enctype);

    krb5_crypto_destroy(context, crypto);

    return ret ;
}

krb5_error_code KRB5_LIB_FUNCTION
krb5_c_encrypt_length(krb5_context context, 
		      krb5_enctype enctype, 
		      size_t inputlen,
		      size_t *length)
{
    krb5_error_code ret;
    krb5_crypto crypto;
    krb5_keyblock key;

    ret = krb5_generate_random_keyblock(context, enctype, &key);
    if (ret)
	return ret;

    ret = krb5_crypto_init(context, &key, 0, &crypto);
    krb5_free_keyblock_contents(context, &key);
    if (ret)
	return ret;

    *length = krb5_get_wrapped_length(context, crypto, inputlen);
    krb5_crypto_destroy(context, crypto);

    return 0;
}

krb5_error_code KRB5_LIB_FUNCTION
krb5_c_enctype_compare(krb5_context context, 
		       krb5_enctype e1,
		       krb5_enctype e2, 
		       krb5_boolean *similar)
{
    *similar = krb5_enctypes_compatible_keys(context, e1, e2);
    return 0;
}

krb5_error_code KRB5_LIB_FUNCTION
krb5_c_make_random_key(krb5_context context,
		       krb5_enctype enctype, 
		       krb5_keyblock *random_key)
{
    return krb5_generate_random_keyblock(context, enctype, random_key);
}

krb5_error_code KRB5_LIB_FUNCTION
krb5_c_keylength(krb5_context context,
		 krb5_enctype enctype,
		 size_t *len)
{
    return krb5_enctype_keysize(context, enctype, len);
}
