// Copyright © 2021 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3

import CWinRT
import _Concurrency

extension IDispatcherQueueController {
  public var DispatcherQueue: IDispatcherQueue {
    get throws {
      var value: UnsafeMutablePointer<__x_ABI_CWindows_CSystem_CIDispatcherQueue>?
      try self.get_DispatcherQueue(&value)
      return IDispatcherQueue(consuming: value)
    }
  }

  public func ShutdownQueueAsync() throws -> IAsyncAction {
    var operation: UnsafeMutablePointer<__x_ABI_CWindows_CFoundation_CIAsyncAction>?
    try self.ShutdownQueueAsync(&operation)
    return IAsyncAction(consuming: operation)
  }
}

extension IDispatcherQueueController {
  public func ShutdownQueue() async throws {
    return try await withUnsafeThrowingContinuation { continuation in
      do {
        return try continuation.resume(returning: self.ShutdownQueueAsync().get())
      } catch let error {
        return continuation.resume(throwing: error)
      }
    }
  }
}
