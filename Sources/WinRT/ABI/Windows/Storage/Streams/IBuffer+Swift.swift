// Copyright © 2021 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3

import WinSDK

extension IBuffer {
  public var Capacity: UINT32 {
    var value: UINT32 = .max
    try! self.get_Capacity(&value)
    return value
  }

  public var Length: UINT32 {
    get {
      var value: UINT32 = .max
      try! self.get_Length(&value)
      return value
    }
    set {
      try! self.put_Length(newValue)
    }
  }
}
