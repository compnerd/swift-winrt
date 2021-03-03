/**
 * Copyright © 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

extension Metadata.Tables {
internal struct MethodImpl: Table {
  /// Record Layout
  ///   Class (TypeDef Index)
  ///   MethodBody (MethodDefOrRef Coded Index)
  ///   MethodDeclaration (MethodDefOrRef Coded Index)
  typealias RecordLayout = (Class: Int, MethodBody: Int, MethodDeclaration: Int)

  let layout: RecordLayout
  let stride: Int
  let rows: Int
  let data: ArraySlice<UInt8>

  public static var number: Int { 25 }

  public init(from data: ArraySlice<UInt8>, rows: UInt32, strides: [TableIndex:Int]) {
    self.layout = (strides[TypeDef.self]!, strides[MethodDefOrRef.self]!, strides[MethodDefOrRef.self]!)
    self.stride = WinMD.stride(of: self.layout)

    self.rows = Int(rows)
    self.data = data.prefix(self.rows * self.stride)
  }
}
}
