// Copyright © 2021 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3

import WinSDK

open class IUnknown {
  @usableFromInline
  internal let pUnk: IUnknownRef

  open class var IID: IID { IID_IUnknown }

  public required init(pUnk pointer: UnsafeMutableRawPointer?) {
    self.pUnk = IUnknownRef(consuming: pointer?.bindMemory(to: WinSDK.IUnknown.self, capacity: 1))
  }

  @_alwaysEmitIntoClient @inline(__always)
  public func QueryInterface(_ iid: REFIID, _ ppvObject: UnsafeMutablePointer<UnsafeMutableRawPointer?>?) throws {
    let pUnk: UnsafeMutablePointer<WinSDK.IUnknown>! = self.pUnk.borrow
    try CHECKED(pUnk.pointee.lpVtbl.pointee.QueryInterface(pUnk, iid, ppvObject))
  }

  @_alwaysEmitIntoClient @inline(__always)
  public func AddRef() -> ULONG {
    let pUnk: UnsafeMutablePointer<WinSDK.IUnknown>! = self.pUnk.borrow
    return pUnk.pointee.lpVtbl.pointee.AddRef(pUnk)
  }

  @_alwaysEmitIntoClient @inline(__always)
  public func Release() -> ULONG {
    let pUnk: UnsafeMutablePointer<WinSDK.IUnknown>! = self.pUnk.borrow
    return pUnk.pointee.lpVtbl.pointee.Release(pUnk)
  }
}
