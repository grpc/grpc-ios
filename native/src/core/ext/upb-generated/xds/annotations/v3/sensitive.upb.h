/* This file was generated by upbc (the upb compiler) from the input
 * file:
 *
 *     xds/annotations/v3/sensitive.proto
 *
 * Do not edit -- your changes will be discarded when the file is
 * regenerated. */

#ifndef XDS_ANNOTATIONS_V3_SENSITIVE_PROTO_UPB_H_
#define XDS_ANNOTATIONS_V3_SENSITIVE_PROTO_UPB_H_

#include "upb/collections/array_internal.h"
#include "upb/collections/map_gencode_util.h"
#include "upb/message/accessors.h"
#include "upb/message/internal.h"
#include "upb/mini_table/enum_internal.h"
#include "upb/wire/decode.h"
#include "upb/wire/decode_fast.h"
#include "upb/wire/encode.h"

// Must be last. 
#include "upb/port/def.inc"

#ifdef __cplusplus
extern "C" {
#endif

extern const upb_MiniTableExtension xds_annotations_v3_sensitive_ext;
struct google_protobuf_FieldOptions;
extern const upb_MiniTable google_protobuf_FieldOptions_msg_init;


UPB_INLINE bool xds_annotations_v3_has_sensitive(const struct google_protobuf_FieldOptions* msg) {
  return _upb_Message_HasExtensionField(msg, &xds_annotations_v3_sensitive_ext);
}
UPB_INLINE void xds_annotations_v3_clear_sensitive(struct google_protobuf_FieldOptions* msg) {
  _upb_Message_ClearExtensionField(msg, &xds_annotations_v3_sensitive_ext);
}
UPB_INLINE bool xds_annotations_v3_sensitive(const struct google_protobuf_FieldOptions* msg) {
  const upb_MiniTableExtension* ext = &xds_annotations_v3_sensitive_ext;
  UPB_ASSUME(!upb_IsRepeatedOrMap(&ext->field));
  UPB_ASSUME(_upb_MiniTableField_GetRep(&ext->field) == kUpb_FieldRep_1Byte);
  bool default_val = false;
  bool ret;
  _upb_Message_GetExtensionField(msg, ext, &default_val, &ret);
  return ret;
}
UPB_INLINE void xds_annotations_v3_set_sensitive(struct google_protobuf_FieldOptions* msg, bool val, upb_Arena* arena) {
  const upb_MiniTableExtension* ext = &xds_annotations_v3_sensitive_ext;
  UPB_ASSUME(!upb_IsRepeatedOrMap(&ext->field));
  UPB_ASSUME(_upb_MiniTableField_GetRep(&ext->field) == kUpb_FieldRep_1Byte);
  bool ok = _upb_Message_SetExtensionField(msg, ext, &val, arena);
  UPB_ASSERT(ok);
}
extern const upb_MiniTableFile xds_annotations_v3_sensitive_proto_upb_file_layout;

#ifdef __cplusplus
}  /* extern "C" */
#endif

#include "upb/port/undef.inc"

#endif  /* XDS_ANNOTATIONS_V3_SENSITIVE_PROTO_UPB_H_ */
