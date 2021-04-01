// Copyright © 2021 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3

import CWinRT

extension BinaryStringEncoding {
  public static var utf8: BinaryStringEncoding {
    BinaryStringEncoding_Utf8
  }

  public static var utf16le: BinaryStringEncoding {
    BinaryStringEncoding_Utf16LE
  }

  public static var utf16be: BinaryStringEncoding {
    BinaryStringEncoding_Utf16BE
  }
}
