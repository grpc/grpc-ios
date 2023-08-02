/* This file was generated by upbc (the upb compiler) from the input
 * file:
 *
 *     envoy/config/trace/v3/opentelemetry.proto
 *
 * Do not edit -- your changes will be discarded when the file is
 * regenerated. */

#include <stddef.h>
#include "upb/collections/array_internal.h"
#include "upb/message/internal.h"
#include "upb/mini_table/enum_internal.h"
#include "envoy/config/trace/v3/opentelemetry.upb.h"
#include "envoy/config/core/v3/grpc_service.upb.h"
#include "udpa/annotations/status.upb.h"

// Must be last.
#include "upb/port/def.inc"

static const upb_MiniTableSub envoy_config_trace_v3_OpenTelemetryConfig_submsgs[1] = {
  {.submsg = &envoy_config_core_v3_GrpcService_msg_init},
};

static const upb_MiniTableField envoy_config_trace_v3_OpenTelemetryConfig__fields[2] = {
  {1, UPB_SIZE(4, 8), 1, 0, 11, kUpb_FieldMode_Scalar | (UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {2, UPB_SIZE(8, 16), 0, kUpb_NoSub, 9, kUpb_FieldMode_Scalar | (kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)},
};

const upb_MiniTable envoy_config_trace_v3_OpenTelemetryConfig_msg_init = {
  &envoy_config_trace_v3_OpenTelemetryConfig_submsgs[0],
  &envoy_config_trace_v3_OpenTelemetryConfig__fields[0],
  UPB_SIZE(16, 32), 2, kUpb_ExtMode_NonExtendable, 2, UPB_FASTTABLE_MASK(24), 0,
  UPB_FASTTABLE_INIT({
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x000800000100000a, &upb_psm_1bt_maxmaxb},
    {0x001000003f000012, &upb_pss_1bt},
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
  })
};

static const upb_MiniTable *messages_layout[1] = {
  &envoy_config_trace_v3_OpenTelemetryConfig_msg_init,
};

const upb_MiniTableFile envoy_config_trace_v3_opentelemetry_proto_upb_file_layout = {
  messages_layout,
  NULL,
  NULL,
  1,
  0,
  0,
};

#include "upb/port/undef.inc"

