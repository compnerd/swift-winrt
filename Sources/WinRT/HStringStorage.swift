// Copyright © 2021 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3

import CWinRT

@_fixed_layout
@usableFromInline
final internal class HStringStorage {
  internal private(set) var hString: HSTRING?

  internal init(_ hString: HSTRING?) throws {
    try CHECKED(WindowsDuplicateString(hString, &self.hString))
  }

  internal init(consuming hString: HSTRING?) {
    self.hString = hString
  }

  internal init(_ buffer: UnsafeBufferPointer<WCHAR>?) throws {
    try CHECKED(WindowsCreateString(buffer?.baseAddress ?? nil,
                                    UINT32(buffer?.count ?? 0),
                                    &self.hString))
  }

  deinit {
    try! CHECKED(WindowsDeleteString(self.hString))
  }
}

