/**
 * Copyright © 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

extension Metadata.Tables {
internal struct GenericParam: Table {
  /// Record Layout
  ///   Number (2-byte index)
  ///   Flags (2-byte bitmask of GenericParamAttributes)
  ///   Owner (TypeOrMethodDef Coded Index)
  ///   Name (String Heap Index)
  typealias RecordLayout = (Number: Int, Flags: Int, Owner: Int, Name: Int)

  let layout: RecordLayout
  let stride: Int
  let rows: Int
  let data: ArraySlice<UInt8>

  public static var number: Int { 42 }

  public init(from data: ArraySlice<UInt8>, rows: UInt32, strides: [TableIndex:Int]) {
    self.layout = (2, 2, strides[TypeOrMethodDef.self]!, strides[.string]!)
    self.stride = WinMD.stride(of: self.layout)

    self.rows = Int(rows)
    self.data = data.prefix(self.rows * self.stride)
  }
}
}
