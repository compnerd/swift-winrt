/**
 * Copyright © 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

extension Metadata.Tables {
internal struct MethodDef: Table {
  /// Record Layout
  ///   RVA (4-byte constant)
  ///   ImplFlags (2-byte bitmask of MethodImplAtttributes)
  ///   Flags (2-byte bitmask of MethodAttributes)
  ///   Name (String Heap Index)
  ///   Signature (Blob Heap Index)
  ///   ParamList (Param Index)
  typealias RecordLayout = (RVA: Int, ImplFlags: Int, Flags: Int, Name: Int, Signature: Int, ParamList: Int)

  let layout: RecordLayout
  let stride: Int
  let rows: Int
  let data: ArraySlice<UInt8>

  public static var number: Int { 6 }

  public init(from data: ArraySlice<UInt8>, rows: UInt32, strides: [TableIndex:Int]) {
    self.layout = (4, 2, 2, strides[.string]!, strides[.blob]!, strides[Param.self]!)
    self.stride = WinMD.stride(of: self.layout)

    self.rows = Int(rows)
    self.data = data.prefix(self.rows * self.stride)
  }
}
}
