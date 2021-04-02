// Copyright © 2021 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3

import CWinRT

@_transparent
private var IID___x_ABI_CWindows_CFoundation_CIAsyncAction: IID {
  IID(Data1: 0x5a648006, Data2: 0x843a, Data3: 0x4da9,
      Data4: (0x86, 0x5b, 0x9d, 0x26, 0xe5, 0xdf, 0xad, 0x7b))
}

public class IAsyncAction: IInspectable {
  override open class var IID: IID { IID___x_ABI_CWindows_CFoundation_CIAsyncAction }

  public func put_Completed(_ handler: UnsafeMutablePointer<__x_ABI_CWindows_CFoundation_CIAsyncActionCompletedHandler>?) throws {
    return try perform(as: __x_ABI_CWindows_CFoundation_CIAsyncAction.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.put_Completed(pThis, handler))
    }
  }

  public func get_Completed(_ handler: UnsafeMutablePointer<UnsafeMutablePointer<__x_ABI_CWindows_CFoundation_CIAsyncActionCompletedHandler>?>?) throws {
    return try perform(as: __x_ABI_CWindows_CFoundation_CIAsyncAction.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.get_Completed(pThis, handler))
    }
  }

  public func GetResults() throws {
    return try perform(as: __x_ABI_CWindows_CFoundation_CIAsyncAction.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetResults(pThis))
    }
  }
}
