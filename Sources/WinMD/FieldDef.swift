/**
 * Copyright © 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

extension Metadata.Tables {
internal struct FieldDef: Table {
  /// Record Layout
  ///   Flags (2-byte bitmask of FieldAttributes)
  ///   Name (String Heap Index)
  ///   Signature (Blob Heap Index)
  typealias RecordLayout = (Flags: Int, Name: Int, Signature: Int)

  let layout: RecordLayout
  let stride: Int
  let rows: Int
  let data: ArraySlice<UInt8>

  public static var number: Int { 4 }

  public init(from data: ArraySlice<UInt8>, rows: UInt32, strides: [TableIndex:Int]) {
    self.layout = (2, strides[.string]!, strides[.blob]!)
    self.stride = WinMD.stride(of: self.layout)

    self.rows = Int(rows)
    self.data = data.prefix(self.rows * self.stride)
  }
}
}
