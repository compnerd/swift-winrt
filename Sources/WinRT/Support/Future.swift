// Copyright © 2021 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3

import CWinRT

internal protocol Future {
  associatedtype ValueType
  func get() throws -> ValueType
}

extension IAsyncAction: Future {
  private final class CompletedHandler: AsyncActionCompletedHandler {
    private var hEvent: HANDLE

    public init(signal event: HANDLE) {
      self.hEvent = event
      super.init()
    }

    override func Invoke(_ asyncInfo: IAsyncAction?,
                         _ asyncStatus: AsyncStatus) -> HRESULT {
      _ = SetEvent(self.hEvent)
      return S_OK
    }
  }

  internal func get() throws -> Void {
    let info: IAsyncInfo = try QueryInterface()
    if info.Status == CWinRT.Started {
      let event: HANDLE =
          CreateEventW(nil, /*bManualReset=*/true, /*DefaultValue=*/false, nil)
      // TODO(compnerd) validate event
      defer { _ = CloseHandle(event) }

      let completion: AsyncActionCompletedHandler =
          IAsyncAction.CompletedHandler(signal: event)
      try withExtendedLifetime(completion) {
        try self.put_Completed(RawPointer(Interface(completion)))
        _ = WaitForSingleObject(event, INFINITE)
      }
    }
    try self.GetResults()
  }
}
