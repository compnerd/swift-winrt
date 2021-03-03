/**
 * Copyright © 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

extension Metadata.Tables {
internal struct TypeDef: Table {
  /// Record Layout
  ///   Flags (4-byte bitmask of TypeAttributes)
  ///   TypeName (String Heap Index)
  ///   TypeNamespace (String Heap Index)
  ///   Extends (TypeDefOrRef Coded Index)
  ///   FieldList (Field Index)
  ///   MethodList (MethodDef Index)
  typealias RecordLayout = (Flags: Int, TypeName: Int, TypeNamespace: Int, Extends: Int, FieldList: Int, MethodList: Int)

  let layout: RecordLayout
  let stride: Int
  let rows: Int
  let data: ArraySlice<UInt8>

  public static var number: Int { 2 }

  public init(from data: ArraySlice<UInt8>, rows: UInt32, strides: [TableIndex:Int]) {
    self.layout = (4, strides[.string]!, strides[.string]!, strides[TypeDefOrRef.self]!, strides[FieldDef.self]!, strides[MethodDef.self]!)
    self.stride = WinMD.stride(of: self.layout)

    self.rows = Int(rows)
    self.data = data.prefix(self.rows * self.stride)
  }
}
}
