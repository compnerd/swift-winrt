// Copyright © 2021 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3

import CWinRT

@_transparent
private var IID___x_ABI_CWindows_CSystem_CIDispatcherQueueController: IID {
  IID(Data1: 0x22f34e66, Data2: 0x50db, Data3: 0x4e36,
      Data4: (0xa9, 0x8d, 0x61, 0xc0, 0x1b, 0x38, 0x4d, 0x20))
}

public class IDispatcherQueueController: IInspectable {
  override open class var IID: IID { IID___x_ABI_CWindows_CSystem_CIDispatcherQueueController }

  public func get_DispatcherQueue(_ value: UnsafeMutablePointer<UnsafeMutablePointer<__x_ABI_CWindows_CSystem_CIDispatcherQueue>?>?) throws {
    return try perform(as: __x_ABI_CWindows_CSystem_CIDispatcherQueueController.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.get_DispatcherQueue(pThis, value))
    }
  }

  public func ShutdownQueueAsync(_ operation: UnsafeMutablePointer<UnsafeMutablePointer<__x_ABI_CWindows_CFoundation_CIAsyncAction>?>?) throws {
    return try perform(as: __x_ABI_CWindows_CSystem_CIDispatcherQueueController.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.ShutdownQueueAsync(pThis, operation))
    }
  }
}
