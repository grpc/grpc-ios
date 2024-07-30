// Copyright 2024 gRPC authors.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include "src/core/lib/transport/call_arena_allocator.h"

#include <algorithm>

#include <grpc/support/port_platform.h>

namespace grpc_core {

void CallArenaAllocator::FinalizeArena(Arena* arena) {
  call_size_estimator_.UpdateCallSizeEstimate(arena->TotalUsedBytes());
}

}  // namespace grpc_core
