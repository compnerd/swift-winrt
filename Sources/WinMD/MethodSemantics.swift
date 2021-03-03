/**
 * Copyright © 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

extension Metadata.Tables {
internal struct MethodSemantics: Table {
  /// Record Layout
  ///   Semantics (2-byte bitmask of MethodSemanticsAttributes)
  ///   Method (MethodDef Index)
  ///   Association (HasSemantics Coded Index)
  typealias RecordLayout = (Semantics: Int, Method: Int, Association: Int)

  let layout: RecordLayout
  let stride: Int
  let rows: Int
  let data: ArraySlice<UInt8>

  public static var number: Int { 24 }

  public init(from data: ArraySlice<UInt8>, rows: UInt32, strides: [TableIndex:Int]) {
    self.layout = (2, strides[MethodDef.self]!, strides[HasSemantics.self]!)
    self.stride = WinMD.stride(of: self.layout)

    self.rows = Int(rows)
    self.data = data.prefix(self.rows * self.stride)
  }
}
}
