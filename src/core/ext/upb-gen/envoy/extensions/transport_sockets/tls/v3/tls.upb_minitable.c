/* This file was generated by upb_generator from the input file:
 *
 *     envoy/extensions/transport_sockets/tls/v3/tls.proto
 *
 * Do not edit -- your changes will be discarded when the file is
 * regenerated.
 * NO CHECKED-IN PROTOBUF GENCODE */

#include <stddef.h>
#include "upb/generated_code_support.h"
#include "envoy/extensions/transport_sockets/tls/v3/tls.upb_minitable.h"
#include "envoy/config/core/v3/address.upb_minitable.h"
#include "envoy/config/core/v3/extension.upb_minitable.h"
#include "envoy/extensions/transport_sockets/tls/v3/common.upb_minitable.h"
#include "envoy/extensions/transport_sockets/tls/v3/secret.upb_minitable.h"
#include "google/protobuf/duration.upb_minitable.h"
#include "google/protobuf/wrappers.upb_minitable.h"
#include "envoy/annotations/deprecation.upb_minitable.h"
#include "udpa/annotations/status.upb_minitable.h"
#include "udpa/annotations/versioning.upb_minitable.h"
#include "validate/validate.upb_minitable.h"

// Must be last.
#include "upb/port/def.inc"

extern const struct upb_MiniTable UPB_PRIVATE(_kUpb_MiniTable_StaticallyTreeShaken);
static const upb_MiniTableSubInternal envoy_extensions_transport_sockets_tls_v3_UpstreamTlsContext_submsgs[3] = {
  {.UPB_PRIVATE(submsg) = &envoy__extensions__transport_0sockets__tls__v3__CommonTlsContext_msg_init_ptr},
  {.UPB_PRIVATE(submsg) = &google__protobuf__UInt32Value_msg_init_ptr},
  {.UPB_PRIVATE(submsg) = &google__protobuf__BoolValue_msg_init_ptr},
};

static const upb_MiniTableField envoy_extensions_transport_sockets_tls_v3_UpstreamTlsContext__fields[5] = {
  {1, UPB_SIZE(12, 16), 64, 0, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {2, UPB_SIZE(28, 24), 0, kUpb_NoSub, 9, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)},
  {3, UPB_SIZE(16, 9), 0, kUpb_NoSub, 8, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_1Byte << kUpb_FieldRep_Shift)},
  {4, UPB_SIZE(20, 40), 65, 1, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {5, UPB_SIZE(24, 48), 66, 2, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
};

const upb_MiniTable envoy__extensions__transport_0sockets__tls__v3__UpstreamTlsContext_msg_init = {
  &envoy_extensions_transport_sockets_tls_v3_UpstreamTlsContext_submsgs[0],
  &envoy_extensions_transport_sockets_tls_v3_UpstreamTlsContext__fields[0],
  UPB_SIZE(40, 56), 5, kUpb_ExtMode_NonExtendable, 5, UPB_FASTTABLE_MASK(24), 0,
#ifdef UPB_TRACING_ENABLED
  "envoy.extensions.transport_sockets.tls.v3.UpstreamTlsContext",
#endif
  UPB_FASTTABLE_INIT({
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x001800003f000012, &upb_pss_1bt},
    {0x000900003f000018, &upb_psb1_1bt},
  })
};

const upb_MiniTable* envoy__extensions__transport_0sockets__tls__v3__UpstreamTlsContext_msg_init_ptr = &envoy__extensions__transport_0sockets__tls__v3__UpstreamTlsContext_msg_init;
static const upb_MiniTableSubInternal envoy_extensions_transport_sockets_tls_v3_DownstreamTlsContext_submsgs[7] = {
  {.UPB_PRIVATE(submsg) = &envoy__extensions__transport_0sockets__tls__v3__CommonTlsContext_msg_init_ptr},
  {.UPB_PRIVATE(submsg) = &google__protobuf__BoolValue_msg_init_ptr},
  {.UPB_PRIVATE(submsg) = &google__protobuf__BoolValue_msg_init_ptr},
  {.UPB_PRIVATE(submsg) = &envoy__extensions__transport_0sockets__tls__v3__TlsSessionTicketKeys_msg_init_ptr},
  {.UPB_PRIVATE(submsg) = &envoy__extensions__transport_0sockets__tls__v3__SdsSecretConfig_msg_init_ptr},
  {.UPB_PRIVATE(submsg) = &google__protobuf__Duration_msg_init_ptr},
  {.UPB_PRIVATE(submsg) = &google__protobuf__BoolValue_msg_init_ptr},
};

static const upb_MiniTableField envoy_extensions_transport_sockets_tls_v3_DownstreamTlsContext__fields[10] = {
  {1, UPB_SIZE(12, 24), 64, 0, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {2, UPB_SIZE(16, 32), 65, 1, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {3, UPB_SIZE(20, 40), 66, 2, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {4, UPB_SIZE(44, 64), UPB_SIZE(-29, -13), 3, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {5, UPB_SIZE(44, 64), UPB_SIZE(-29, -13), 4, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {6, UPB_SIZE(24, 48), 67, 5, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {7, UPB_SIZE(44, 64), UPB_SIZE(-29, -13), kUpb_NoSub, 8, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_1Byte << kUpb_FieldRep_Shift)},
  {8, UPB_SIZE(32, 16), 0, kUpb_NoSub, 5, (int)kUpb_FieldMode_Scalar | (int)kUpb_LabelFlags_IsAlternate | ((int)kUpb_FieldRep_4Byte << kUpb_FieldRep_Shift)},
  {9, UPB_SIZE(36, 56), 68, 6, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {10, UPB_SIZE(40, 20), 0, kUpb_NoSub, 8, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_1Byte << kUpb_FieldRep_Shift)},
};

const upb_MiniTable envoy__extensions__transport_0sockets__tls__v3__DownstreamTlsContext_msg_init = {
  &envoy_extensions_transport_sockets_tls_v3_DownstreamTlsContext_submsgs[0],
  &envoy_extensions_transport_sockets_tls_v3_DownstreamTlsContext__fields[0],
  UPB_SIZE(48, 72), 10, kUpb_ExtMode_NonExtendable, 10, UPB_FASTTABLE_MASK(120), 0,
#ifdef UPB_TRACING_ENABLED
  "envoy.extensions.transport_sockets.tls.v3.DownstreamTlsContext",
#endif
  UPB_FASTTABLE_INIT({
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x0040000c04030022, &upb_pom_1bt_maxmaxb},
    {0x0040000c0504002a, &upb_pom_1bt_maxmaxb},
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x0040000c07000038, &upb_pob1_1bt},
    {0x001000003f000040, &upb_psv4_1bt},
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x001400003f000050, &upb_psb1_1bt},
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
  })
};

const upb_MiniTable* envoy__extensions__transport_0sockets__tls__v3__DownstreamTlsContext_msg_init_ptr = &envoy__extensions__transport_0sockets__tls__v3__DownstreamTlsContext_msg_init;
static const upb_MiniTableSubInternal envoy_extensions_transport_sockets_tls_v3_TlsKeyLog_submsgs[2] = {
  {.UPB_PRIVATE(submsg) = &envoy__config__core__v3__CidrRange_msg_init_ptr},
  {.UPB_PRIVATE(submsg) = &envoy__config__core__v3__CidrRange_msg_init_ptr},
};

static const upb_MiniTableField envoy_extensions_transport_sockets_tls_v3_TlsKeyLog__fields[3] = {
  {1, UPB_SIZE(16, 8), 0, kUpb_NoSub, 9, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)},
  {2, UPB_SIZE(8, 24), 0, 0, 11, (int)kUpb_FieldMode_Array | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {3, UPB_SIZE(12, 32), 0, 1, 11, (int)kUpb_FieldMode_Array | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
};

const upb_MiniTable envoy__extensions__transport_0sockets__tls__v3__TlsKeyLog_msg_init = {
  &envoy_extensions_transport_sockets_tls_v3_TlsKeyLog_submsgs[0],
  &envoy_extensions_transport_sockets_tls_v3_TlsKeyLog__fields[0],
  UPB_SIZE(24, 40), 3, kUpb_ExtMode_NonExtendable, 3, UPB_FASTTABLE_MASK(24), 0,
#ifdef UPB_TRACING_ENABLED
  "envoy.extensions.transport_sockets.tls.v3.TlsKeyLog",
#endif
  UPB_FASTTABLE_INIT({
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x000800003f00000a, &upb_pss_1bt},
    {0x001800003f000012, &upb_prm_1bt_maxmaxb},
    {0x002000003f01001a, &upb_prm_1bt_maxmaxb},
  })
};

const upb_MiniTable* envoy__extensions__transport_0sockets__tls__v3__TlsKeyLog_msg_init_ptr = &envoy__extensions__transport_0sockets__tls__v3__TlsKeyLog_msg_init;
static const upb_MiniTableSubInternal envoy_extensions_transport_sockets_tls_v3_CommonTlsContext_submsgs[13] = {
  {.UPB_PRIVATE(submsg) = &envoy__extensions__transport_0sockets__tls__v3__TlsParameters_msg_init_ptr},
  {.UPB_PRIVATE(submsg) = &envoy__extensions__transport_0sockets__tls__v3__TlsCertificate_msg_init_ptr},
  {.UPB_PRIVATE(submsg) = &envoy__extensions__transport_0sockets__tls__v3__CertificateValidationContext_msg_init_ptr},
  {.UPB_PRIVATE(submsg) = &envoy__extensions__transport_0sockets__tls__v3__SdsSecretConfig_msg_init_ptr},
  {.UPB_PRIVATE(submsg) = &envoy__extensions__transport_0sockets__tls__v3__SdsSecretConfig_msg_init_ptr},
  {.UPB_PRIVATE(submsg) = &envoy__extensions__transport_0sockets__tls__v3__CommonTlsContext__CombinedCertificateValidationContext_msg_init_ptr},
  {.UPB_PRIVATE(submsg) = &envoy__extensions__transport_0sockets__tls__v3__CommonTlsContext__CertificateProvider_msg_init_ptr},
  {.UPB_PRIVATE(submsg) = &envoy__extensions__transport_0sockets__tls__v3__CommonTlsContext__CertificateProvider_msg_init_ptr},
  {.UPB_PRIVATE(submsg) = &envoy__extensions__transport_0sockets__tls__v3__CommonTlsContext__CertificateProviderInstance_msg_init_ptr},
  {.UPB_PRIVATE(submsg) = &envoy__extensions__transport_0sockets__tls__v3__CommonTlsContext__CertificateProviderInstance_msg_init_ptr},
  {.UPB_PRIVATE(submsg) = &envoy__config__core__v3__TypedExtensionConfig_msg_init_ptr},
  {.UPB_PRIVATE(submsg) = &envoy__extensions__transport_0sockets__tls__v3__CertificateProviderPluginInstance_msg_init_ptr},
  {.UPB_PRIVATE(submsg) = &envoy__extensions__transport_0sockets__tls__v3__TlsKeyLog_msg_init_ptr},
};

static const upb_MiniTableField envoy_extensions_transport_sockets_tls_v3_CommonTlsContext__fields[14] = {
  {1, UPB_SIZE(12, 16), 64, 0, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {2, UPB_SIZE(16, 24), 0, 1, 11, (int)kUpb_FieldMode_Array | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {3, UPB_SIZE(52, 88), UPB_SIZE(-37, -13), 2, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {4, UPB_SIZE(20, 32), 0, kUpb_NoSub, 9, (int)kUpb_FieldMode_Array | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {6, UPB_SIZE(24, 40), 0, 3, 11, (int)kUpb_FieldMode_Array | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {7, UPB_SIZE(52, 88), UPB_SIZE(-37, -13), 4, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {8, UPB_SIZE(52, 88), UPB_SIZE(-37, -13), 5, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {9, UPB_SIZE(28, 48), 65, 6, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {10, UPB_SIZE(52, 88), UPB_SIZE(-37, -13), 7, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {11, UPB_SIZE(32, 56), 66, 8, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {12, UPB_SIZE(52, 88), UPB_SIZE(-37, -13), 9, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {13, UPB_SIZE(40, 64), 67, 10, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {14, UPB_SIZE(44, 72), 68, 11, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {15, UPB_SIZE(48, 80), 69, 12, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
};

const upb_MiniTable envoy__extensions__transport_0sockets__tls__v3__CommonTlsContext_msg_init = {
  &envoy_extensions_transport_sockets_tls_v3_CommonTlsContext_submsgs[0],
  &envoy_extensions_transport_sockets_tls_v3_CommonTlsContext__fields[0],
  UPB_SIZE(56, 96), 14, kUpb_ExtMode_NonExtendable, 4, UPB_FASTTABLE_MASK(120), 0,
#ifdef UPB_TRACING_ENABLED
  "envoy.extensions.transport_sockets.tls.v3.CommonTlsContext",
#endif
  UPB_FASTTABLE_INIT({
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x001800003f010012, &upb_prm_1bt_maxmaxb},
    {0x0058000c0302001a, &upb_pom_1bt_maxmaxb},
    {0x002000003f000022, &upb_prs_1bt},
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x002800003f030032, &upb_prm_1bt_maxmaxb},
    {0x0058000c0704003a, &upb_pom_1bt_maxmaxb},
    {0x0058000c08050042, &upb_pom_1bt_max64b},
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x0058000c0a070052, &upb_pom_1bt_max64b},
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x0058000c0c090062, &upb_pom_1bt_max64b},
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
  })
};

const upb_MiniTable* envoy__extensions__transport_0sockets__tls__v3__CommonTlsContext_msg_init_ptr = &envoy__extensions__transport_0sockets__tls__v3__CommonTlsContext_msg_init;
static const upb_MiniTableSubInternal envoy_extensions_transport_sockets_tls_v3_CommonTlsContext_CertificateProvider_submsgs[1] = {
  {.UPB_PRIVATE(submsg) = &envoy__config__core__v3__TypedExtensionConfig_msg_init_ptr},
};

static const upb_MiniTableField envoy_extensions_transport_sockets_tls_v3_CommonTlsContext_CertificateProvider__fields[2] = {
  {1, 16, 0, kUpb_NoSub, 9, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)},
  {2, UPB_SIZE(12, 32), -9, 0, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
};

const upb_MiniTable envoy__extensions__transport_0sockets__tls__v3__CommonTlsContext__CertificateProvider_msg_init = {
  &envoy_extensions_transport_sockets_tls_v3_CommonTlsContext_CertificateProvider_submsgs[0],
  &envoy_extensions_transport_sockets_tls_v3_CommonTlsContext_CertificateProvider__fields[0],
  UPB_SIZE(24, 40), 2, kUpb_ExtMode_NonExtendable, 2, UPB_FASTTABLE_MASK(24), 0,
#ifdef UPB_TRACING_ENABLED
  "envoy.extensions.transport_sockets.tls.v3.CommonTlsContext.CertificateProvider",
#endif
  UPB_FASTTABLE_INIT({
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x001000003f00000a, &upb_pss_1bt},
    {0x0020000802000012, &upb_pom_1bt_maxmaxb},
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
  })
};

const upb_MiniTable* envoy__extensions__transport_0sockets__tls__v3__CommonTlsContext__CertificateProvider_msg_init_ptr = &envoy__extensions__transport_0sockets__tls__v3__CommonTlsContext__CertificateProvider_msg_init;
static const upb_MiniTableField envoy_extensions_transport_sockets_tls_v3_CommonTlsContext_CertificateProviderInstance__fields[2] = {
  {1, 8, 0, kUpb_NoSub, 9, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)},
  {2, UPB_SIZE(16, 24), 0, kUpb_NoSub, 9, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)},
};

const upb_MiniTable envoy__extensions__transport_0sockets__tls__v3__CommonTlsContext__CertificateProviderInstance_msg_init = {
  NULL,
  &envoy_extensions_transport_sockets_tls_v3_CommonTlsContext_CertificateProviderInstance__fields[0],
  UPB_SIZE(24, 40), 2, kUpb_ExtMode_NonExtendable, 2, UPB_FASTTABLE_MASK(24), 0,
#ifdef UPB_TRACING_ENABLED
  "envoy.extensions.transport_sockets.tls.v3.CommonTlsContext.CertificateProviderInstance",
#endif
  UPB_FASTTABLE_INIT({
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x000800003f00000a, &upb_pss_1bt},
    {0x001800003f000012, &upb_pss_1bt},
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
  })
};

const upb_MiniTable* envoy__extensions__transport_0sockets__tls__v3__CommonTlsContext__CertificateProviderInstance_msg_init_ptr = &envoy__extensions__transport_0sockets__tls__v3__CommonTlsContext__CertificateProviderInstance_msg_init;
static const upb_MiniTableSubInternal envoy_extensions_transport_sockets_tls_v3_CommonTlsContext_CombinedCertificateValidationContext_submsgs[4] = {
  {.UPB_PRIVATE(submsg) = &envoy__extensions__transport_0sockets__tls__v3__CertificateValidationContext_msg_init_ptr},
  {.UPB_PRIVATE(submsg) = &envoy__extensions__transport_0sockets__tls__v3__SdsSecretConfig_msg_init_ptr},
  {.UPB_PRIVATE(submsg) = &envoy__extensions__transport_0sockets__tls__v3__CommonTlsContext__CertificateProvider_msg_init_ptr},
  {.UPB_PRIVATE(submsg) = &envoy__extensions__transport_0sockets__tls__v3__CommonTlsContext__CertificateProviderInstance_msg_init_ptr},
};

static const upb_MiniTableField envoy_extensions_transport_sockets_tls_v3_CommonTlsContext_CombinedCertificateValidationContext__fields[4] = {
  {1, UPB_SIZE(12, 16), 64, 0, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {2, UPB_SIZE(16, 24), 65, 1, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {3, UPB_SIZE(20, 32), 66, 2, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {4, UPB_SIZE(24, 40), 67, 3, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
};

const upb_MiniTable envoy__extensions__transport_0sockets__tls__v3__CommonTlsContext__CombinedCertificateValidationContext_msg_init = {
  &envoy_extensions_transport_sockets_tls_v3_CommonTlsContext_CombinedCertificateValidationContext_submsgs[0],
  &envoy_extensions_transport_sockets_tls_v3_CommonTlsContext_CombinedCertificateValidationContext__fields[0],
  UPB_SIZE(32, 48), 4, kUpb_ExtMode_NonExtendable, 4, UPB_FASTTABLE_MASK(255), 0,
#ifdef UPB_TRACING_ENABLED
  "envoy.extensions.transport_sockets.tls.v3.CommonTlsContext.CombinedCertificateValidationContext",
#endif
};

const upb_MiniTable* envoy__extensions__transport_0sockets__tls__v3__CommonTlsContext__CombinedCertificateValidationContext_msg_init_ptr = &envoy__extensions__transport_0sockets__tls__v3__CommonTlsContext__CombinedCertificateValidationContext_msg_init;
static const upb_MiniTable *messages_layout[7] = {
  &envoy__extensions__transport_0sockets__tls__v3__UpstreamTlsContext_msg_init,
  &envoy__extensions__transport_0sockets__tls__v3__DownstreamTlsContext_msg_init,
  &envoy__extensions__transport_0sockets__tls__v3__TlsKeyLog_msg_init,
  &envoy__extensions__transport_0sockets__tls__v3__CommonTlsContext_msg_init,
  &envoy__extensions__transport_0sockets__tls__v3__CommonTlsContext__CertificateProvider_msg_init,
  &envoy__extensions__transport_0sockets__tls__v3__CommonTlsContext__CertificateProviderInstance_msg_init,
  &envoy__extensions__transport_0sockets__tls__v3__CommonTlsContext__CombinedCertificateValidationContext_msg_init,
};

const upb_MiniTableFile envoy_extensions_transport_sockets_tls_v3_tls_proto_upb_file_layout = {
  messages_layout,
  NULL,
  NULL,
  7,
  0,
  0,
};

#include "upb/port/undef.inc"

