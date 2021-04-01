// Copyright © 2021 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3

import WinSDK

public typealias REFIID = UnsafePointer<IID>

// winerror.h

@_transparent
public var E_INVALIDARG: HRESULT {
  HRESULT(bitPattern: 0x80070057)
}

@_transparent
public var E_NOTIMPL: HRESULT {
  HRESULT(bitPattern: 0x80004001)
}

@_transparent
public var E_NOINTERFACE: HRESULT {
  HRESULT(bitPattern: 0x80004002)
}

// winnt.h

@_transparent
internal func MAKELANGID(_ p: WORD, _ s: WORD) -> DWORD {
  return DWORD((s << 10) | p)
}
