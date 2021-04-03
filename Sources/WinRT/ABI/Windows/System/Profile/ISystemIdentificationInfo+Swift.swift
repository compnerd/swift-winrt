// Copyright © 2021 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3

import CWinRT

extension ISystemIdentificationInfo {
  public var Id: IBuffer {
    var value: UnsafeMutablePointer<__x_ABI_CWindows_CStorage_CStreams_CIBuffer>?
    try! self.get_Id(&value)
    return IBuffer(consuming: value)
  }

  public var Source: SystemIdentificationSource {
    var value: SystemIdentificationSource = .none
    try! self.get_Source(&value)
    return value
  }
}
