/**
 * Copyright © 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

extension Metadata.Tables {
internal struct FieldRVA: Table {
  /// Record Layout
  ///   RVA (4-byte constant)
  ///   Field (Field Index)
  typealias RecordLayout = (RVA: Int, Field: Int)

  let layout: RecordLayout
  let stride: Int
  let rows: Int
  let data: ArraySlice<UInt8>

  public static var number: Int { 29 }

  public init(from data: ArraySlice<UInt8>, rows: UInt32, strides: [TableIndex:Int]) {
    self.layout = (4, strides[FieldDef.self]!)
    self.stride = WinMD.stride(of: self.layout)

    self.rows = Int(rows)
    self.data = data.prefix(self.rows * self.stride)
  }
}
}
