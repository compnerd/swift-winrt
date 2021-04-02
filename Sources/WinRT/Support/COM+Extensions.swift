// Copyright © 2021 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3

import WinSDK

extension _GUID: CustomStringConvertible {
  public var description: String {
    withUnsafePointer(to: self) { pGUID in
      Array<WCHAR>(unsafeUninitializedCapacity: 40) {
        $1 = Int(StringFromGUID2(pGUID, $0.baseAddress, CInt($0.count)))
      }.withUnsafeBufferPointer {
        String(decodingCString: $0.baseAddress!, as: UTF16.self)
      }
    }
  }
}
