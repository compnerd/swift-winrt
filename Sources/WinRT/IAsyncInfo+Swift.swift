// Copyright © 2021 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3

import CWinRT
import _Concurrency

extension IAsyncInfo {
  public var Id: Int {
    get throws {
      var id: CUnsignedInt = .max
      try self.get_Id(&id)
      return Int(id)
    }
  }

  public var Status: AsyncStatus {
    get throws {
      var status: AsyncStatus = CWinRT.Error
      try self.get_Status(&status)
      return status
    }
  }

  public var ErrorCode: HRESULT {
    get throws {
      var errorCode: HRESULT = S_OK
      try self.get_ErrorCode(&errorCode)
      return errorCode
    }
  }
}
