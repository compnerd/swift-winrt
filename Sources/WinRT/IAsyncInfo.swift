// Copyright © 2021 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3

import CWinRT

public class IAsyncInfo: IInspectable {
  override open class var IID: IID { IID_IAsyncInfo }

  public func get_Id(_ id: UnsafeMutablePointer<CUnsignedInt>?) throws {
    return try perform(as: CWinRT.IAsyncInfo.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.get_Id(pThis, id))
    }
  }

  public func get_Status(_ status: UnsafeMutablePointer<AsyncStatus>?) throws {
    return try perform(as: CWinRT.IAsyncInfo.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.get_Status(pThis, status))
    }
  }

  public func get_ErrorCode(_ errorCode: UnsafeMutablePointer<HRESULT>?) throws {
    return try perform(as: CWinRT.IAsyncInfo.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.get_ErrorCode(pThis, errorCode))
    }
  }

  public func Cancel() throws {
    return try perform(as: CWinRT.IAsyncInfo.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.Cancel(pThis))
    }
  }

  public func Close() throws {
    return try perform(as: CWinRT.IAsyncInfo.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.Close(pThis))
    }
  }
}
