// Copyright © 2021 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3

import CWinRT

@_transparent
private var IID___x_ABI_CWindows_CSystem_CProfile_CISystemIdentificationStatics: IID {
  IID(Data1: 0x5581f42a, Data2: 0xd3df, Data3: 0x4d93,
      Data4: (0xa3, 0x7d, 0xc4, 0x1a, 0x61, 0x6c, 0x6d, 0x01))
}

public class ISystemIdentificationStatics: IInspectable {
  override public class var IID: IID { IID___x_ABI_CWindows_CSystem_CProfile_CISystemIdentificationStatics }

  public func GetSystemIdForPublisher(_ result: UnsafeMutablePointer<UnsafeMutablePointer<__x_ABI_CWindows_CSystem_CProfile_CISystemIdentificationInfo>?>?) throws {
    return try perform(as: __x_ABI_CWindows_CSystem_CProfile_CISystemIdentificationStatics.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetSystemIdForPublisher(pThis, result))
    }
  }

  public func GetSystemIdForUser(_ user: UnsafeMutablePointer<__x_ABI_CWindows_CSystem_CIUser>?, _ result: UnsafeMutablePointer<UnsafeMutablePointer<__x_ABI_CWindows_CSystem_CProfile_CISystemIdentificationInfo>?>?) throws {
    return try perform(as: __x_ABI_CWindows_CSystem_CProfile_CISystemIdentificationStatics.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetSystemIdForUser(pThis, user, result))
    }
  }
}
