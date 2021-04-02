// Copyright © 2021 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3

import CWinRT

@_transparent
private var IID___x_ABI_CWindows_CSystem_CIDispatcherQueueControllerStatics: IID {
  IID(Data1: 0x0a6c98e0, Data2: 0x5198, Data3: 0x49a2,
      Data4: (0xa3, 0x13, 0x3f, 0x70, 0xd1, 0xf1, 0x3c, 0x27))
}

public class IDispatcherQueueControllerStatics: IInspectable {
  override open class var IID: IID { IID___x_ABI_CWindows_CSystem_CIDispatcherQueueControllerStatics }

  public func CreateOnDedicatedThread(_ result: UnsafeMutablePointer<UnsafeMutablePointer<__x_ABI_CWindows_CSystem_CIDispatcherQueueController>?>?) throws {
    return try perform(as: __x_ABI_CWindows_CSystem_CIDispatcherQueueControllerStatics.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.CreateOnDedicatedThread(pThis, result))
    }
  }
}
