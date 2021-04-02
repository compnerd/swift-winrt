// Copyright © 2021 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3

import CWinRT

extension IAsyncInfo {
  public var Id: Int {
    var id: CUnsignedInt = .max
    try! self.get_Id(&id)
    return Int(id)
  }

  public var Status: AsyncStatus {
    var status: AsyncStatus = CWinRT.Error
    try! self.get_Status(&status)
    return status
  }

  public var ErrorCode: HRESULT {
    var errorCode: HRESULT = S_OK
    try! self.get_ErrorCode(&errorCode)
    return errorCode;
  }
}
