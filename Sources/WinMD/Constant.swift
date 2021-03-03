/**
 * Copyright © 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

extension Metadata.Tables {
internal struct Constant: Table {
  /// Record Layout
  ///   Type (1-byte, 1-byte padding zero)
  ///   Parent (HasConstant Coded Index)
  ///   Value (Blob Heap Index)
  typealias RecordLayout = (Type: Int, Int, Parent: Int, Value: Int)

  let layout: RecordLayout
  let stride: Int
  let rows: Int
  let data: ArraySlice<UInt8>

  public static var number: Int { 11 }

  public init(from data: ArraySlice<UInt8>, rows: UInt32, strides: [TableIndex:Int]) {
    self.layout = (1, 1, strides[HasConstant.self]!, strides[.blob]!)
    self.stride = WinMD.stride(of: self.layout)

    self.rows = Int(rows)
    self.data = data.prefix(self.rows * self.stride)
  }
}
}
