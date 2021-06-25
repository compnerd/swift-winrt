// Copyright © 2021 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3

import CWinRT
import _Concurrency

extension ISystemIdentificationInfo {
  public var Id: IBuffer {
    get throws {
      var value: UnsafeMutablePointer<__x_ABI_CWindows_CStorage_CStreams_CIBuffer>?
      try self.get_Id(&value)
      return IBuffer(consuming: value)
    }
  }

  public var Source: SystemIdentificationSource {
    get throws {
      var value: SystemIdentificationSource = .none
      try self.get_Source(&value)
      return value
    }
  }
}
