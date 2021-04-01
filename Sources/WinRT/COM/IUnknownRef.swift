// Copyright © 2021 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3

import WinSDK

@_fixed_layout
@usableFromInline
final internal class IUnknownRef {
  private var pUnk: UnsafeMutablePointer<WinSDK.IUnknown>?

  init(_ pUnk: UnsafeMutablePointer<WinSDK.IUnknown>?) {
    self.pUnk = pUnk
    _ = self.pUnk?.pointee.lpVtbl.pointee.AddRef(self.pUnk)
  }

  init(consuming pUnk: UnsafeMutablePointer<WinSDK.IUnknown>?) {
    self.pUnk = pUnk
  }

  deinit {
    _ = self.pUnk?.pointee.lpVtbl.pointee.Release(self.pUnk)
  }

  @usableFromInline
  internal var borrow: UnsafeMutablePointer<WinSDK.IUnknown>? {
    return self.pUnk
  }

  @usableFromInline
  internal var ref: UnsafeMutablePointer<WinSDK.IUnknown>? {
    _ = self.pUnk?.pointee.lpVtbl.pointee.AddRef(self.pUnk)
    return self.pUnk
  }
}
