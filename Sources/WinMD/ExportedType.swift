/**
 * Copyright © 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

extension Metadata.Tables {
internal struct ExportedType: Table {
  /// Record Layout
  ///   Flags (4-byte bitmask TypeAttributes)
  ///   TypeDefId (4-byte value, foreign TypeDef Index)
  ///   TypeName (String Heap Index)
  ///   TypeNamespace (String Heap Index)
  ///   Implementation (Implementation Coded Index)
  typealias RecordLayout = (Flags: Int, TypeDefId: Int, TypeName: Int, TypeNamespace: Int, Implementation: Int)

  let layout: RecordLayout
  let stride: Int
  let rows: Int
  let data: ArraySlice<UInt8>

  public static var number: Int { 39 }

  public init(from data: ArraySlice<UInt8>, rows: UInt32, strides: [TableIndex:Int]) {
    self.layout = (4, 4, strides[.string]!, strides[.string]!, strides[Implementation.self]!)
    self.stride = WinMD.stride(of: self.layout)

    self.rows = Int(rows)
    self.data = data.prefix(self.rows * self.stride)
  }
}
}
