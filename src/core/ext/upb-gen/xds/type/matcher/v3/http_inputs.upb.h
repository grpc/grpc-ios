/* This file was generated by upb_generator from the input file:
 *
 *     xds/type/matcher/v3/http_inputs.proto
 *
 * Do not edit -- your changes will be discarded when the file is
 * regenerated.
 * NO CHECKED-IN PROTOBUF GENCODE */

#ifndef XDS_TYPE_MATCHER_V3_HTTP_INPUTS_PROTO_UPB_H_
#define XDS_TYPE_MATCHER_V3_HTTP_INPUTS_PROTO_UPB_H_

#include "upb/generated_code_support.h"

#include "xds/type/matcher/v3/http_inputs.upb_minitable.h"

#include "xds/annotations/v3/status.upb_minitable.h"

// Must be last.
#include "upb/port/def.inc"

#ifdef __cplusplus
extern "C" {
#endif

typedef struct xds_type_matcher_v3_HttpAttributesCelMatchInput { upb_Message UPB_PRIVATE(base); } xds_type_matcher_v3_HttpAttributesCelMatchInput;



/* xds.type.matcher.v3.HttpAttributesCelMatchInput */

UPB_INLINE xds_type_matcher_v3_HttpAttributesCelMatchInput* xds_type_matcher_v3_HttpAttributesCelMatchInput_new(upb_Arena* arena) {
  return (xds_type_matcher_v3_HttpAttributesCelMatchInput*)_upb_Message_New(&xds__type__matcher__v3__HttpAttributesCelMatchInput_msg_init, arena);
}
UPB_INLINE xds_type_matcher_v3_HttpAttributesCelMatchInput* xds_type_matcher_v3_HttpAttributesCelMatchInput_parse(const char* buf, size_t size, upb_Arena* arena) {
  xds_type_matcher_v3_HttpAttributesCelMatchInput* ret = xds_type_matcher_v3_HttpAttributesCelMatchInput_new(arena);
  if (!ret) return NULL;
  if (upb_Decode(buf, size, UPB_UPCAST(ret), &xds__type__matcher__v3__HttpAttributesCelMatchInput_msg_init, NULL, 0, arena) !=
      kUpb_DecodeStatus_Ok) {
    return NULL;
  }
  return ret;
}
UPB_INLINE xds_type_matcher_v3_HttpAttributesCelMatchInput* xds_type_matcher_v3_HttpAttributesCelMatchInput_parse_ex(const char* buf, size_t size,
                           const upb_ExtensionRegistry* extreg,
                           int options, upb_Arena* arena) {
  xds_type_matcher_v3_HttpAttributesCelMatchInput* ret = xds_type_matcher_v3_HttpAttributesCelMatchInput_new(arena);
  if (!ret) return NULL;
  if (upb_Decode(buf, size, UPB_UPCAST(ret), &xds__type__matcher__v3__HttpAttributesCelMatchInput_msg_init, extreg, options,
                 arena) != kUpb_DecodeStatus_Ok) {
    return NULL;
  }
  return ret;
}
UPB_INLINE char* xds_type_matcher_v3_HttpAttributesCelMatchInput_serialize(const xds_type_matcher_v3_HttpAttributesCelMatchInput* msg, upb_Arena* arena, size_t* len) {
  char* ptr;
  (void)upb_Encode(UPB_UPCAST(msg), &xds__type__matcher__v3__HttpAttributesCelMatchInput_msg_init, 0, arena, &ptr, len);
  return ptr;
}
UPB_INLINE char* xds_type_matcher_v3_HttpAttributesCelMatchInput_serialize_ex(const xds_type_matcher_v3_HttpAttributesCelMatchInput* msg, int options,
                                 upb_Arena* arena, size_t* len) {
  char* ptr;
  (void)upb_Encode(UPB_UPCAST(msg), &xds__type__matcher__v3__HttpAttributesCelMatchInput_msg_init, options, arena, &ptr, len);
  return ptr;
}


#ifdef __cplusplus
}  /* extern "C" */
#endif

#include "upb/port/undef.inc"

#endif  /* XDS_TYPE_MATCHER_V3_HTTP_INPUTS_PROTO_UPB_H_ */
