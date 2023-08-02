/* This file was generated by upbc (the upb compiler) from the input
 * file:
 *
 *     xds/data/orca/v3/orca_load_report.proto
 *
 * Do not edit -- your changes will be discarded when the file is
 * regenerated. */

#ifndef XDS_DATA_ORCA_V3_ORCA_LOAD_REPORT_PROTO_UPB_H_
#define XDS_DATA_ORCA_V3_ORCA_LOAD_REPORT_PROTO_UPB_H_

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

typedef struct xds_data_orca_v3_OrcaLoadReport xds_data_orca_v3_OrcaLoadReport;
typedef struct xds_data_orca_v3_OrcaLoadReport_RequestCostEntry xds_data_orca_v3_OrcaLoadReport_RequestCostEntry;
typedef struct xds_data_orca_v3_OrcaLoadReport_UtilizationEntry xds_data_orca_v3_OrcaLoadReport_UtilizationEntry;
typedef struct xds_data_orca_v3_OrcaLoadReport_NamedMetricsEntry xds_data_orca_v3_OrcaLoadReport_NamedMetricsEntry;
extern const upb_MiniTable xds_data_orca_v3_OrcaLoadReport_msg_init;
extern const upb_MiniTable xds_data_orca_v3_OrcaLoadReport_RequestCostEntry_msg_init;
extern const upb_MiniTable xds_data_orca_v3_OrcaLoadReport_UtilizationEntry_msg_init;
extern const upb_MiniTable xds_data_orca_v3_OrcaLoadReport_NamedMetricsEntry_msg_init;



/* xds.data.orca.v3.OrcaLoadReport */

UPB_INLINE xds_data_orca_v3_OrcaLoadReport* xds_data_orca_v3_OrcaLoadReport_new(upb_Arena* arena) {
  return (xds_data_orca_v3_OrcaLoadReport*)_upb_Message_New(&xds_data_orca_v3_OrcaLoadReport_msg_init, arena);
}
UPB_INLINE xds_data_orca_v3_OrcaLoadReport* xds_data_orca_v3_OrcaLoadReport_parse(const char* buf, size_t size, upb_Arena* arena) {
  xds_data_orca_v3_OrcaLoadReport* ret = xds_data_orca_v3_OrcaLoadReport_new(arena);
  if (!ret) return NULL;
  if (upb_Decode(buf, size, ret, &xds_data_orca_v3_OrcaLoadReport_msg_init, NULL, 0, arena) != kUpb_DecodeStatus_Ok) {
    return NULL;
  }
  return ret;
}
UPB_INLINE xds_data_orca_v3_OrcaLoadReport* xds_data_orca_v3_OrcaLoadReport_parse_ex(const char* buf, size_t size,
                           const upb_ExtensionRegistry* extreg,
                           int options, upb_Arena* arena) {
  xds_data_orca_v3_OrcaLoadReport* ret = xds_data_orca_v3_OrcaLoadReport_new(arena);
  if (!ret) return NULL;
  if (upb_Decode(buf, size, ret, &xds_data_orca_v3_OrcaLoadReport_msg_init, extreg, options, arena) !=
      kUpb_DecodeStatus_Ok) {
    return NULL;
  }
  return ret;
}
UPB_INLINE char* xds_data_orca_v3_OrcaLoadReport_serialize(const xds_data_orca_v3_OrcaLoadReport* msg, upb_Arena* arena, size_t* len) {
  char* ptr;
  (void)upb_Encode(msg, &xds_data_orca_v3_OrcaLoadReport_msg_init, 0, arena, &ptr, len);
  return ptr;
}
UPB_INLINE char* xds_data_orca_v3_OrcaLoadReport_serialize_ex(const xds_data_orca_v3_OrcaLoadReport* msg, int options,
                                 upb_Arena* arena, size_t* len) {
  char* ptr;
  (void)upb_Encode(msg, &xds_data_orca_v3_OrcaLoadReport_msg_init, options, arena, &ptr, len);
  return ptr;
}
UPB_INLINE void xds_data_orca_v3_OrcaLoadReport_clear_cpu_utilization(xds_data_orca_v3_OrcaLoadReport* msg) {
  const upb_MiniTableField field = {1, UPB_SIZE(16, 0), 0, kUpb_NoSub, 1, kUpb_FieldMode_Scalar | (kUpb_FieldRep_8Byte << kUpb_FieldRep_Shift)};
  _upb_Message_ClearNonExtensionField(msg, &field);
}
UPB_INLINE double xds_data_orca_v3_OrcaLoadReport_cpu_utilization(const xds_data_orca_v3_OrcaLoadReport* msg) {
  double default_val = 0;
  double ret;
  const upb_MiniTableField field = {1, UPB_SIZE(16, 0), 0, kUpb_NoSub, 1, kUpb_FieldMode_Scalar | (kUpb_FieldRep_8Byte << kUpb_FieldRep_Shift)};
  _upb_Message_GetNonExtensionField(msg, &field, &default_val, &ret);
  return ret;
}
UPB_INLINE void xds_data_orca_v3_OrcaLoadReport_clear_mem_utilization(xds_data_orca_v3_OrcaLoadReport* msg) {
  const upb_MiniTableField field = {2, UPB_SIZE(24, 8), 0, kUpb_NoSub, 1, kUpb_FieldMode_Scalar | (kUpb_FieldRep_8Byte << kUpb_FieldRep_Shift)};
  _upb_Message_ClearNonExtensionField(msg, &field);
}
UPB_INLINE double xds_data_orca_v3_OrcaLoadReport_mem_utilization(const xds_data_orca_v3_OrcaLoadReport* msg) {
  double default_val = 0;
  double ret;
  const upb_MiniTableField field = {2, UPB_SIZE(24, 8), 0, kUpb_NoSub, 1, kUpb_FieldMode_Scalar | (kUpb_FieldRep_8Byte << kUpb_FieldRep_Shift)};
  _upb_Message_GetNonExtensionField(msg, &field, &default_val, &ret);
  return ret;
}
UPB_INLINE void xds_data_orca_v3_OrcaLoadReport_clear_rps(xds_data_orca_v3_OrcaLoadReport* msg) {
  const upb_MiniTableField field = {3, UPB_SIZE(32, 16), 0, kUpb_NoSub, 4, kUpb_FieldMode_Scalar | (kUpb_FieldRep_8Byte << kUpb_FieldRep_Shift)};
  _upb_Message_ClearNonExtensionField(msg, &field);
}
UPB_INLINE uint64_t xds_data_orca_v3_OrcaLoadReport_rps(const xds_data_orca_v3_OrcaLoadReport* msg) {
  uint64_t default_val = (uint64_t)0ull;
  uint64_t ret;
  const upb_MiniTableField field = {3, UPB_SIZE(32, 16), 0, kUpb_NoSub, 4, kUpb_FieldMode_Scalar | (kUpb_FieldRep_8Byte << kUpb_FieldRep_Shift)};
  _upb_Message_GetNonExtensionField(msg, &field, &default_val, &ret);
  return ret;
}
UPB_INLINE void xds_data_orca_v3_OrcaLoadReport_clear_request_cost(xds_data_orca_v3_OrcaLoadReport* msg) {
  const upb_MiniTableField field = {4, UPB_SIZE(0, 24), 0, 0, 11, kUpb_FieldMode_Map | (UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)};
  _upb_Message_ClearNonExtensionField(msg, &field);
}
UPB_INLINE size_t xds_data_orca_v3_OrcaLoadReport_request_cost_size(const xds_data_orca_v3_OrcaLoadReport* msg) {
  const upb_MiniTableField field = {4, UPB_SIZE(0, 24), 0, 0, 11, kUpb_FieldMode_Map | (UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)};
  const upb_Map* map = upb_Message_GetMap(msg, &field);
  return map ? _upb_Map_Size(map) : 0;
}
UPB_INLINE bool xds_data_orca_v3_OrcaLoadReport_request_cost_get(const xds_data_orca_v3_OrcaLoadReport* msg, upb_StringView key, double* val) {
  const upb_MiniTableField field = {4, UPB_SIZE(0, 24), 0, 0, 11, kUpb_FieldMode_Map | (UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)};
  const upb_Map* map = upb_Message_GetMap(msg, &field);
  if (!map) return false;
  return _upb_Map_Get(map, &key, 0, val, sizeof(*val));
}
UPB_INLINE const xds_data_orca_v3_OrcaLoadReport_RequestCostEntry* xds_data_orca_v3_OrcaLoadReport_request_cost_next(const xds_data_orca_v3_OrcaLoadReport* msg, size_t* iter) {
  const upb_MiniTableField field = {4, UPB_SIZE(0, 24), 0, 0, 11, kUpb_FieldMode_Map | (UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)};
  const upb_Map* map = upb_Message_GetMap(msg, &field);
  if (!map) return NULL;
  return (const xds_data_orca_v3_OrcaLoadReport_RequestCostEntry*)_upb_map_next(map, iter);
}
UPB_INLINE void xds_data_orca_v3_OrcaLoadReport_clear_utilization(xds_data_orca_v3_OrcaLoadReport* msg) {
  const upb_MiniTableField field = {5, UPB_SIZE(4, 32), 0, 1, 11, kUpb_FieldMode_Map | (UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)};
  _upb_Message_ClearNonExtensionField(msg, &field);
}
UPB_INLINE size_t xds_data_orca_v3_OrcaLoadReport_utilization_size(const xds_data_orca_v3_OrcaLoadReport* msg) {
  const upb_MiniTableField field = {5, UPB_SIZE(4, 32), 0, 1, 11, kUpb_FieldMode_Map | (UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)};
  const upb_Map* map = upb_Message_GetMap(msg, &field);
  return map ? _upb_Map_Size(map) : 0;
}
UPB_INLINE bool xds_data_orca_v3_OrcaLoadReport_utilization_get(const xds_data_orca_v3_OrcaLoadReport* msg, upb_StringView key, double* val) {
  const upb_MiniTableField field = {5, UPB_SIZE(4, 32), 0, 1, 11, kUpb_FieldMode_Map | (UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)};
  const upb_Map* map = upb_Message_GetMap(msg, &field);
  if (!map) return false;
  return _upb_Map_Get(map, &key, 0, val, sizeof(*val));
}
UPB_INLINE const xds_data_orca_v3_OrcaLoadReport_UtilizationEntry* xds_data_orca_v3_OrcaLoadReport_utilization_next(const xds_data_orca_v3_OrcaLoadReport* msg, size_t* iter) {
  const upb_MiniTableField field = {5, UPB_SIZE(4, 32), 0, 1, 11, kUpb_FieldMode_Map | (UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)};
  const upb_Map* map = upb_Message_GetMap(msg, &field);
  if (!map) return NULL;
  return (const xds_data_orca_v3_OrcaLoadReport_UtilizationEntry*)_upb_map_next(map, iter);
}
UPB_INLINE void xds_data_orca_v3_OrcaLoadReport_clear_rps_fractional(xds_data_orca_v3_OrcaLoadReport* msg) {
  const upb_MiniTableField field = {6, 40, 0, kUpb_NoSub, 1, kUpb_FieldMode_Scalar | (kUpb_FieldRep_8Byte << kUpb_FieldRep_Shift)};
  _upb_Message_ClearNonExtensionField(msg, &field);
}
UPB_INLINE double xds_data_orca_v3_OrcaLoadReport_rps_fractional(const xds_data_orca_v3_OrcaLoadReport* msg) {
  double default_val = 0;
  double ret;
  const upb_MiniTableField field = {6, 40, 0, kUpb_NoSub, 1, kUpb_FieldMode_Scalar | (kUpb_FieldRep_8Byte << kUpb_FieldRep_Shift)};
  _upb_Message_GetNonExtensionField(msg, &field, &default_val, &ret);
  return ret;
}
UPB_INLINE void xds_data_orca_v3_OrcaLoadReport_clear_eps(xds_data_orca_v3_OrcaLoadReport* msg) {
  const upb_MiniTableField field = {7, 48, 0, kUpb_NoSub, 1, kUpb_FieldMode_Scalar | (kUpb_FieldRep_8Byte << kUpb_FieldRep_Shift)};
  _upb_Message_ClearNonExtensionField(msg, &field);
}
UPB_INLINE double xds_data_orca_v3_OrcaLoadReport_eps(const xds_data_orca_v3_OrcaLoadReport* msg) {
  double default_val = 0;
  double ret;
  const upb_MiniTableField field = {7, 48, 0, kUpb_NoSub, 1, kUpb_FieldMode_Scalar | (kUpb_FieldRep_8Byte << kUpb_FieldRep_Shift)};
  _upb_Message_GetNonExtensionField(msg, &field, &default_val, &ret);
  return ret;
}
UPB_INLINE void xds_data_orca_v3_OrcaLoadReport_clear_named_metrics(xds_data_orca_v3_OrcaLoadReport* msg) {
  const upb_MiniTableField field = {8, UPB_SIZE(8, 56), 0, 2, 11, kUpb_FieldMode_Map | (UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)};
  _upb_Message_ClearNonExtensionField(msg, &field);
}
UPB_INLINE size_t xds_data_orca_v3_OrcaLoadReport_named_metrics_size(const xds_data_orca_v3_OrcaLoadReport* msg) {
  const upb_MiniTableField field = {8, UPB_SIZE(8, 56), 0, 2, 11, kUpb_FieldMode_Map | (UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)};
  const upb_Map* map = upb_Message_GetMap(msg, &field);
  return map ? _upb_Map_Size(map) : 0;
}
UPB_INLINE bool xds_data_orca_v3_OrcaLoadReport_named_metrics_get(const xds_data_orca_v3_OrcaLoadReport* msg, upb_StringView key, double* val) {
  const upb_MiniTableField field = {8, UPB_SIZE(8, 56), 0, 2, 11, kUpb_FieldMode_Map | (UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)};
  const upb_Map* map = upb_Message_GetMap(msg, &field);
  if (!map) return false;
  return _upb_Map_Get(map, &key, 0, val, sizeof(*val));
}
UPB_INLINE const xds_data_orca_v3_OrcaLoadReport_NamedMetricsEntry* xds_data_orca_v3_OrcaLoadReport_named_metrics_next(const xds_data_orca_v3_OrcaLoadReport* msg, size_t* iter) {
  const upb_MiniTableField field = {8, UPB_SIZE(8, 56), 0, 2, 11, kUpb_FieldMode_Map | (UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)};
  const upb_Map* map = upb_Message_GetMap(msg, &field);
  if (!map) return NULL;
  return (const xds_data_orca_v3_OrcaLoadReport_NamedMetricsEntry*)_upb_map_next(map, iter);
}

UPB_INLINE void xds_data_orca_v3_OrcaLoadReport_set_cpu_utilization(xds_data_orca_v3_OrcaLoadReport *msg, double value) {
  const upb_MiniTableField field = {1, UPB_SIZE(16, 0), 0, kUpb_NoSub, 1, kUpb_FieldMode_Scalar | (kUpb_FieldRep_8Byte << kUpb_FieldRep_Shift)};
  _upb_Message_SetNonExtensionField(msg, &field, &value);
}
UPB_INLINE void xds_data_orca_v3_OrcaLoadReport_set_mem_utilization(xds_data_orca_v3_OrcaLoadReport *msg, double value) {
  const upb_MiniTableField field = {2, UPB_SIZE(24, 8), 0, kUpb_NoSub, 1, kUpb_FieldMode_Scalar | (kUpb_FieldRep_8Byte << kUpb_FieldRep_Shift)};
  _upb_Message_SetNonExtensionField(msg, &field, &value);
}
UPB_INLINE void xds_data_orca_v3_OrcaLoadReport_set_rps(xds_data_orca_v3_OrcaLoadReport *msg, uint64_t value) {
  const upb_MiniTableField field = {3, UPB_SIZE(32, 16), 0, kUpb_NoSub, 4, kUpb_FieldMode_Scalar | (kUpb_FieldRep_8Byte << kUpb_FieldRep_Shift)};
  _upb_Message_SetNonExtensionField(msg, &field, &value);
}
UPB_INLINE void xds_data_orca_v3_OrcaLoadReport_request_cost_clear(xds_data_orca_v3_OrcaLoadReport* msg) {
  const upb_MiniTableField field = {4, UPB_SIZE(0, 24), 0, 0, 11, kUpb_FieldMode_Map | (UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)};
  upb_Map* map = (upb_Map*)upb_Message_GetMap(msg, &field);
  if (!map) return;
  _upb_Map_Clear(map);
}
UPB_INLINE bool xds_data_orca_v3_OrcaLoadReport_request_cost_set(xds_data_orca_v3_OrcaLoadReport* msg, upb_StringView key, double val, upb_Arena* a) {
  const upb_MiniTableField field = {4, UPB_SIZE(0, 24), 0, 0, 11, kUpb_FieldMode_Map | (UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)};
  upb_Map* map = _upb_Message_GetOrCreateMutableMap(msg, &field, 0, sizeof(val), a);
  return _upb_Map_Insert(map, &key, 0, &val, sizeof(val), a) !=
         kUpb_MapInsertStatus_OutOfMemory;
}
UPB_INLINE bool xds_data_orca_v3_OrcaLoadReport_request_cost_delete(xds_data_orca_v3_OrcaLoadReport* msg, upb_StringView key) {
  const upb_MiniTableField field = {4, UPB_SIZE(0, 24), 0, 0, 11, kUpb_FieldMode_Map | (UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)};
  upb_Map* map = (upb_Map*)upb_Message_GetMap(msg, &field);
  if (!map) return false;
  return _upb_Map_Delete(map, &key, 0, NULL);
}
UPB_INLINE xds_data_orca_v3_OrcaLoadReport_RequestCostEntry* xds_data_orca_v3_OrcaLoadReport_request_cost_nextmutable(xds_data_orca_v3_OrcaLoadReport* msg, size_t* iter) {
  const upb_MiniTableField field = {4, UPB_SIZE(0, 24), 0, 0, 11, kUpb_FieldMode_Map | (UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)};
  upb_Map* map = (upb_Map*)upb_Message_GetMap(msg, &field);
  if (!map) return NULL;
  return (xds_data_orca_v3_OrcaLoadReport_RequestCostEntry*)_upb_map_next(map, iter);
}
UPB_INLINE void xds_data_orca_v3_OrcaLoadReport_utilization_clear(xds_data_orca_v3_OrcaLoadReport* msg) {
  const upb_MiniTableField field = {5, UPB_SIZE(4, 32), 0, 1, 11, kUpb_FieldMode_Map | (UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)};
  upb_Map* map = (upb_Map*)upb_Message_GetMap(msg, &field);
  if (!map) return;
  _upb_Map_Clear(map);
}
UPB_INLINE bool xds_data_orca_v3_OrcaLoadReport_utilization_set(xds_data_orca_v3_OrcaLoadReport* msg, upb_StringView key, double val, upb_Arena* a) {
  const upb_MiniTableField field = {5, UPB_SIZE(4, 32), 0, 1, 11, kUpb_FieldMode_Map | (UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)};
  upb_Map* map = _upb_Message_GetOrCreateMutableMap(msg, &field, 0, sizeof(val), a);
  return _upb_Map_Insert(map, &key, 0, &val, sizeof(val), a) !=
         kUpb_MapInsertStatus_OutOfMemory;
}
UPB_INLINE bool xds_data_orca_v3_OrcaLoadReport_utilization_delete(xds_data_orca_v3_OrcaLoadReport* msg, upb_StringView key) {
  const upb_MiniTableField field = {5, UPB_SIZE(4, 32), 0, 1, 11, kUpb_FieldMode_Map | (UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)};
  upb_Map* map = (upb_Map*)upb_Message_GetMap(msg, &field);
  if (!map) return false;
  return _upb_Map_Delete(map, &key, 0, NULL);
}
UPB_INLINE xds_data_orca_v3_OrcaLoadReport_UtilizationEntry* xds_data_orca_v3_OrcaLoadReport_utilization_nextmutable(xds_data_orca_v3_OrcaLoadReport* msg, size_t* iter) {
  const upb_MiniTableField field = {5, UPB_SIZE(4, 32), 0, 1, 11, kUpb_FieldMode_Map | (UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)};
  upb_Map* map = (upb_Map*)upb_Message_GetMap(msg, &field);
  if (!map) return NULL;
  return (xds_data_orca_v3_OrcaLoadReport_UtilizationEntry*)_upb_map_next(map, iter);
}
UPB_INLINE void xds_data_orca_v3_OrcaLoadReport_set_rps_fractional(xds_data_orca_v3_OrcaLoadReport *msg, double value) {
  const upb_MiniTableField field = {6, 40, 0, kUpb_NoSub, 1, kUpb_FieldMode_Scalar | (kUpb_FieldRep_8Byte << kUpb_FieldRep_Shift)};
  _upb_Message_SetNonExtensionField(msg, &field, &value);
}
UPB_INLINE void xds_data_orca_v3_OrcaLoadReport_set_eps(xds_data_orca_v3_OrcaLoadReport *msg, double value) {
  const upb_MiniTableField field = {7, 48, 0, kUpb_NoSub, 1, kUpb_FieldMode_Scalar | (kUpb_FieldRep_8Byte << kUpb_FieldRep_Shift)};
  _upb_Message_SetNonExtensionField(msg, &field, &value);
}
UPB_INLINE void xds_data_orca_v3_OrcaLoadReport_named_metrics_clear(xds_data_orca_v3_OrcaLoadReport* msg) {
  const upb_MiniTableField field = {8, UPB_SIZE(8, 56), 0, 2, 11, kUpb_FieldMode_Map | (UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)};
  upb_Map* map = (upb_Map*)upb_Message_GetMap(msg, &field);
  if (!map) return;
  _upb_Map_Clear(map);
}
UPB_INLINE bool xds_data_orca_v3_OrcaLoadReport_named_metrics_set(xds_data_orca_v3_OrcaLoadReport* msg, upb_StringView key, double val, upb_Arena* a) {
  const upb_MiniTableField field = {8, UPB_SIZE(8, 56), 0, 2, 11, kUpb_FieldMode_Map | (UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)};
  upb_Map* map = _upb_Message_GetOrCreateMutableMap(msg, &field, 0, sizeof(val), a);
  return _upb_Map_Insert(map, &key, 0, &val, sizeof(val), a) !=
         kUpb_MapInsertStatus_OutOfMemory;
}
UPB_INLINE bool xds_data_orca_v3_OrcaLoadReport_named_metrics_delete(xds_data_orca_v3_OrcaLoadReport* msg, upb_StringView key) {
  const upb_MiniTableField field = {8, UPB_SIZE(8, 56), 0, 2, 11, kUpb_FieldMode_Map | (UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)};
  upb_Map* map = (upb_Map*)upb_Message_GetMap(msg, &field);
  if (!map) return false;
  return _upb_Map_Delete(map, &key, 0, NULL);
}
UPB_INLINE xds_data_orca_v3_OrcaLoadReport_NamedMetricsEntry* xds_data_orca_v3_OrcaLoadReport_named_metrics_nextmutable(xds_data_orca_v3_OrcaLoadReport* msg, size_t* iter) {
  const upb_MiniTableField field = {8, UPB_SIZE(8, 56), 0, 2, 11, kUpb_FieldMode_Map | (UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)};
  upb_Map* map = (upb_Map*)upb_Message_GetMap(msg, &field);
  if (!map) return NULL;
  return (xds_data_orca_v3_OrcaLoadReport_NamedMetricsEntry*)_upb_map_next(map, iter);
}

/* xds.data.orca.v3.OrcaLoadReport.RequestCostEntry */

UPB_INLINE upb_StringView xds_data_orca_v3_OrcaLoadReport_RequestCostEntry_key(const xds_data_orca_v3_OrcaLoadReport_RequestCostEntry* msg) {
  upb_StringView ret;
  _upb_msg_map_key(msg, &ret, 0);
  return ret;
}
UPB_INLINE double xds_data_orca_v3_OrcaLoadReport_RequestCostEntry_value(const xds_data_orca_v3_OrcaLoadReport_RequestCostEntry* msg) {
  double ret;
  _upb_msg_map_value(msg, &ret, sizeof(ret));
  return ret;
}

UPB_INLINE void xds_data_orca_v3_OrcaLoadReport_RequestCostEntry_set_value(xds_data_orca_v3_OrcaLoadReport_RequestCostEntry *msg, double value) {
  _upb_msg_map_set_value(msg, &value, sizeof(double));
}

/* xds.data.orca.v3.OrcaLoadReport.UtilizationEntry */

UPB_INLINE upb_StringView xds_data_orca_v3_OrcaLoadReport_UtilizationEntry_key(const xds_data_orca_v3_OrcaLoadReport_UtilizationEntry* msg) {
  upb_StringView ret;
  _upb_msg_map_key(msg, &ret, 0);
  return ret;
}
UPB_INLINE double xds_data_orca_v3_OrcaLoadReport_UtilizationEntry_value(const xds_data_orca_v3_OrcaLoadReport_UtilizationEntry* msg) {
  double ret;
  _upb_msg_map_value(msg, &ret, sizeof(ret));
  return ret;
}

UPB_INLINE void xds_data_orca_v3_OrcaLoadReport_UtilizationEntry_set_value(xds_data_orca_v3_OrcaLoadReport_UtilizationEntry *msg, double value) {
  _upb_msg_map_set_value(msg, &value, sizeof(double));
}

/* xds.data.orca.v3.OrcaLoadReport.NamedMetricsEntry */

UPB_INLINE upb_StringView xds_data_orca_v3_OrcaLoadReport_NamedMetricsEntry_key(const xds_data_orca_v3_OrcaLoadReport_NamedMetricsEntry* msg) {
  upb_StringView ret;
  _upb_msg_map_key(msg, &ret, 0);
  return ret;
}
UPB_INLINE double xds_data_orca_v3_OrcaLoadReport_NamedMetricsEntry_value(const xds_data_orca_v3_OrcaLoadReport_NamedMetricsEntry* msg) {
  double ret;
  _upb_msg_map_value(msg, &ret, sizeof(ret));
  return ret;
}

UPB_INLINE void xds_data_orca_v3_OrcaLoadReport_NamedMetricsEntry_set_value(xds_data_orca_v3_OrcaLoadReport_NamedMetricsEntry *msg, double value) {
  _upb_msg_map_set_value(msg, &value, sizeof(double));
}

extern const upb_MiniTableFile xds_data_orca_v3_orca_load_report_proto_upb_file_layout;

#ifdef __cplusplus
}  /* extern "C" */
#endif

#include "upb/port/undef.inc"

#endif  /* XDS_DATA_ORCA_V3_ORCA_LOAD_REPORT_PROTO_UPB_H_ */
