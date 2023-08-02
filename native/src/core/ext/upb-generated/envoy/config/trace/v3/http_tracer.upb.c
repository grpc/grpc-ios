/* This file was generated by upbc (the upb compiler) from the input
 * file:
 *
 *     envoy/config/trace/v3/http_tracer.proto
 *
 * Do not edit -- your changes will be discarded when the file is
 * regenerated. */

#include <stddef.h>
#include "upb/collections/array_internal.h"
#include "upb/message/internal.h"
#include "upb/mini_table/enum_internal.h"
#include "envoy/config/trace/v3/http_tracer.upb.h"
#include "google/protobuf/any.upb.h"
#include "udpa/annotations/status.upb.h"
#include "udpa/annotations/versioning.upb.h"
#include "validate/validate.upb.h"

// Must be last.
#include "upb/port/def.inc"

static const upb_MiniTableSub envoy_config_trace_v3_Tracing_submsgs[1] = {
  {.submsg = &envoy_config_trace_v3_Tracing_Http_msg_init},
};

static const upb_MiniTableField envoy_config_trace_v3_Tracing__fields[1] = {
  {1, UPB_SIZE(4, 8), 1, 0, 11, kUpb_FieldMode_Scalar | (UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
};

const upb_MiniTable envoy_config_trace_v3_Tracing_msg_init = {
  &envoy_config_trace_v3_Tracing_submsgs[0],
  &envoy_config_trace_v3_Tracing__fields[0],
  UPB_SIZE(8, 16), 1, kUpb_ExtMode_NonExtendable, 1, UPB_FASTTABLE_MASK(8), 0,
  UPB_FASTTABLE_INIT({
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x000800000100000a, &upb_psm_1bt_max64b},
  })
};

static const upb_MiniTableSub envoy_config_trace_v3_Tracing_Http_submsgs[1] = {
  {.submsg = &google_protobuf_Any_msg_init},
};

static const upb_MiniTableField envoy_config_trace_v3_Tracing_Http__fields[2] = {
  {1, 8, 0, kUpb_NoSub, 9, kUpb_FieldMode_Scalar | (kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)},
  {3, UPB_SIZE(4, 24), -1, 0, 11, kUpb_FieldMode_Scalar | (UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
};

const upb_MiniTable envoy_config_trace_v3_Tracing_Http_msg_init = {
  &envoy_config_trace_v3_Tracing_Http_submsgs[0],
  &envoy_config_trace_v3_Tracing_Http__fields[0],
  UPB_SIZE(16, 32), 2, kUpb_ExtMode_NonExtendable, 1, UPB_FASTTABLE_MASK(24), 0,
  UPB_FASTTABLE_INIT({
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x000800003f00000a, &upb_pss_1bt},
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x001800000300001a, &upb_pom_1bt_maxmaxb},
  })
};

static const upb_MiniTable *messages_layout[2] = {
  &envoy_config_trace_v3_Tracing_msg_init,
  &envoy_config_trace_v3_Tracing_Http_msg_init,
};

const upb_MiniTableFile envoy_config_trace_v3_http_tracer_proto_upb_file_layout = {
  messages_layout,
  NULL,
  NULL,
  2,
  0,
  0,
};

#include "upb/port/undef.inc"

