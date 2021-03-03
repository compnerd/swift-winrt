/**
 * Copyright © 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

extension Metadata.Tables {
internal struct Module: Table {
  /// Record Layout
  ///   Generation (2-byte value, reserved, MBZ)
  ///   Name (String Heap Index)
  ///   Mvid (Module Version ID) (GUID Heap Index)
  ///   EncId (GUID Heap Index, reserved, MBZ)
  ///   EncBaseId (GUID Heap Index, reserved, MBZ)
  typealias RecordLayout = (Generation: Int, Name: Int, Mvid: Int, EncId: Int, EncBaseId: Int)

  let layout: RecordLayout
  let stride: Int
  let rows: Int
  let data: ArraySlice<UInt8>

  public static var number: Int { 0 }

  public init(from data: ArraySlice<UInt8>, rows: UInt32, strides: [TableIndex:Int]) {
    self.layout = (2, strides[.string]!, strides[.guid]!, strides[.guid]!, strides[.guid]!)
    self.stride = WinMD.stride(of: self.layout)

    self.rows = Int(rows)
    self.data = data.prefix(self.rows * self.stride)
  }
}
}
