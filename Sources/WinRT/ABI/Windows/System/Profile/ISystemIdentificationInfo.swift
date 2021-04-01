// Copyright © 2021 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3

import CWinRT

@_transparent
private var IID___x_ABI_CWindows_CSystem_CProfile_CISystemIdentificationInfo: IID {
  IID(Data1: 0x0c659e7d, Data2: 0xc3c2, Data3: 0x4d33,
      Data4: (0xa2, 0xdf, 0x21, 0xbc, 0x41, 0x91, 0x6e, 0xbe))
}

public class ISystemIdentificationInfo: IInspectable {
  override public class var IID: IID { IID___x_ABI_CWindows_CSystem_CProfile_CISystemIdentificationInfo }

  public func get_Id(_ value: UnsafeMutablePointer<UnsafeMutablePointer<__x_ABI_CWindows_CStorage_CStreams_CIBuffer>?>?) throws {
    return try perform(as: __x_ABI_CWindows_CSystem_CProfile_CISystemIdentificationInfo.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.get_Id(pThis, value))
    }
  }

  public func get_Source(_ value: UnsafeMutablePointer<__x_ABI_CWindows_CSystem_CProfile_CSystemIdentificationSource>?) throws {
    return try perform(as: __x_ABI_CWindows_CSystem_CProfile_CISystemIdentificationInfo.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.get_Source(pThis, value))
    }
  }
}
