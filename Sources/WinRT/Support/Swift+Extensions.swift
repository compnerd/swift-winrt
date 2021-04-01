// Copyright © 2021 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3

import CWinRT

extension String {
  internal init(from hString: HSTRING) {
    var length: UINT32 = 0
    let pwszBuffer: PCWSTR = WindowsGetStringRawBuffer(hString, &length)
    self.init(decoding: UnsafeBufferPointer(start: pwszBuffer, count: Int(length)), as: UTF16.self)
  }
}