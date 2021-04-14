// Copyright © 2021 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3

import CWinRT

private var IID___x_ABI_CWindows_CSystem_CIUser: IID {
  IID(Data1: 0xdf9a26c6, Data2: 0xe746, Data3: 0x3bcd,
      Data4: (0xb5, 0xd4, 0x12, 0x01, 0x03, 0xc4, 0x20, 0x9b))
}

public class IUser: IInspectable {
  override public class var IID: IID { IID___x_ABI_CWindows_CSystem_CIUser }

  public func get_NonRoamableId(_ value: UnsafeMutablePointer<HSTRING?>) throws {
    return try perform(as: __x_ABI_CWindows_CSystem_CIUser.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.get_NonRoamableId(pThis, value))
    }
  }

  public func get_AuthenticationStatus(_ value: UnsafeMutablePointer<__x_ABI_CWindows_CSystem_CUserAuthenticationStatus>?) throws {
    return try perform(as: __x_ABI_CWindows_CSystem_CIUser.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.get_AuthenticationStatus(pThis, value))
    }
  }

  public func get_Type(_ value: UnsafeMutablePointer<__x_ABI_CWindows_CSystem_CUserType>?) throws {
    return try perform(as: __x_ABI_CWindows_CSystem_CIUser.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.get_Type(pThis, value))
    }
  }

  public func GetPropertyAsync(_ value: HSTRING?, _ operation: UnsafeMutablePointer<UnsafeMutablePointer<CWinRT.__FIAsyncOperation_1_IInspectable>?>?) throws {
    return try perform(as: __x_ABI_CWindows_CSystem_CIUser.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetPropertyAsync(pThis, value, operation))
    }
  }

  public func GetPropertiesAsync(_ values: UnsafeMutablePointer<CWinRT.__FIVectorView_1_HSTRING>?, _ operation: UnsafeMutablePointer<UnsafeMutablePointer<CWinRT.__FIAsyncOperation_1___F__CIPropertySet>?>?) throws {
    return try perform(as: __x_ABI_CWindows_CSystem_CIUser.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetPropertiesAsync(pThis, values, operation))
    }
  }

  public func GetPictureAsync(_ desiredSize: __x_ABI_CWindows_CSystem_CUserPictureSize, _ operation: UnsafeMutablePointer<UnsafeMutablePointer<__FIAsyncOperation_1_Windows__CStorage__CStreams__CIRandomAccessStreamReference>?>?) throws {
    return try perform(as: __x_ABI_CWindows_CSystem_CIUser.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetPictureAsync(pThis, desiredSize, operation))
    }
  }
}
