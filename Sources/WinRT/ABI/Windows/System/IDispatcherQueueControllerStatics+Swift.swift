// Copyright © 2021 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3

import CWinRT

extension IDispatcherQueueControllerStatics {
  public func CreateOnDedicatedThread() throws -> IDispatcherQueueController {
    var result: UnsafeMutablePointer<__x_ABI_CWindows_CSystem_CIDispatcherQueueController>?
    try self.CreateOnDedicatedThread(&result)
    return IDispatcherQueueController(consuming: result)
  }
}
