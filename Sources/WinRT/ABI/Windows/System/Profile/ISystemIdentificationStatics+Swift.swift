// Copyright © 2021 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3

import CWinRT

extension ISystemIdentificationStatics {
  public func GetSystemIdForPublisher() throws -> ISystemIdentificationInfo {
    var result: UnsafeMutablePointer<__x_ABI_CWindows_CSystem_CProfile_CISystemIdentificationInfo>?
    try self.GetSystemIdForPublisher(&result)
    return ISystemIdentificationInfo(consuming: result)
  }

  public func GetSystemIdForUser(_ user: IUser) throws -> ISystemIdentificationInfo {
    var result: UnsafeMutablePointer<__x_ABI_CWindows_CSystem_CProfile_CISystemIdentificationInfo>?
    try self.GetSystemIdForUser(RawPointer(user), &result)
    return ISystemIdentificationInfo(consuming: result)
  }
}
