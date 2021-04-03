// Copyright © 2021 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3

import CWinRT

@_transparent
private var IID___x_ABI_CWindows_CFoundation_CIAsyncActionCompletedHandler: IID {
  IID(Data1: 0xa4ed5c81, Data2: 0x76c9, Data3: 0x40bd,
      Data4: (0x8b, 0xe6, 0xb1, 0xd9, 0x0f, 0xb2, 0x0a, 0xe7))
}

public class IAsyncActionCompletedHandler: IUnknown {
  override public class var IID: IID { IID___x_ABI_CWindows_CFoundation_CIAsyncActionCompletedHandler }

  public func Invoke(_ asyncInfo: UnsafeMutablePointer<__x_ABI_CWindows_CFoundation_CIAsyncAction>?, _ asyncStatus: AsyncStatus) throws {
    return try perform(as: __x_ABI_CWindows_CFoundation_CIAsyncActionCompletedHandler.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.Invoke(pThis, asyncInfo, asyncStatus))
    }
  }
}
