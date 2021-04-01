// Copyright © 2021 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3

import CWinRT

@_transparent
private var IID___x_ABI_CWindows_CStorage_CStreams_CIBuffer: IID {
  IID(Data1: 0x905a0fe0, Data2: 0xbc53, Data3: 0x11df,
      Data4: (0x8c, 0x49, 0x00, 0x1e, 0x4f, 0xc6, 0x86, 0xda))
}

public class IBuffer: IInspectable {
  override public class var IID: IID { IID___x_ABI_CWindows_CStorage_CStreams_CIBuffer }

  public func get_Capacity(_ value: UnsafeMutablePointer<UINT32>?) throws {
    return try perform(as: __x_ABI_CWindows_CStorage_CStreams_CIBuffer.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.get_Capacity(pThis, value))
    }
  }

  public func get_Length(_ value: UnsafeMutablePointer<UINT32>?) throws {
    return try perform(as: __x_ABI_CWindows_CStorage_CStreams_CIBuffer.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.get_Length(pThis, value))
    }
  }

  public func put_Length(_ value: UINT32) throws {
    return try perform(as: __x_ABI_CWindows_CStorage_CStreams_CIBuffer.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.put_Length(pThis, value))
    }
  }
}
