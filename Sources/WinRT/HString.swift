// Copyright © 2021 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3

import CWinRT

@_implementationOnly
import func ucrt.wcslen

public class HString {
  internal private(set) var hRef: HStringStorage

  public init(_ string: String) throws {
    self.hRef = try string.withCString(encodedAs: UTF16.self) {
      try HStringStorage(UnsafeBufferPointer(start: $0, count: wcslen($0)))
    }
  }

  public init(_ buffer: UnsafeBufferPointer<WCHAR>?) throws {
    self.hRef = try HStringStorage(buffer)
  }

  public init(consuming hString: CWinRT.HSTRING?) {
    self.hRef = HStringStorage(consuming: hString)
  }
}