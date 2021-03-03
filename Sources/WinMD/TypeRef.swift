/**
 * Copyright © 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

extension Metadata.Tables {
internal struct TypeRef: Table {
  /// Record Layout
  ///   ResolutionScope (ResolutionScope Coded Index)
  ///   TypeName (String Heap Index)
  ///   TypeNamespace (String Heap Index)
  typealias RecordLayout = (ResolutionScope: Int, TypeName: Int, TypeNamespace: Int)

  let layout: RecordLayout
  let stride: Int
  let rows: Int
  let data: ArraySlice<UInt8>

  public static var number: Int { 1 }

  public init(from data: ArraySlice<UInt8>, rows: UInt32, strides: [TableIndex:Int]) {
    self.layout = (strides[ResolutionScope.self]!, strides[.string]!, strides[.string]!)
    self.stride = WinMD.stride(of: self.layout)

    self.rows = Int(rows)
    self.data = data.prefix(self.rows * self.stride)
  }
}
}
