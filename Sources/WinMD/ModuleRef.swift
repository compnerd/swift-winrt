/**
 * Copyright © 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

extension Metadata.Tables {
internal struct ModuleRef: Table {
  /// Record Layout
  ///   Name (String Heap Index)
  typealias RecordLayout = (Name: Int, ())

  let layout: RecordLayout
  let stride: Int
  let rows: Int
  let data: ArraySlice<UInt8>

  public static var number: Int { 26 }

  public init(from data: ArraySlice<UInt8>, rows: UInt32, strides: [TableIndex:Int]) {
    self.layout = (strides[.string]!, ())
    self.stride = strides[.string]!

    self.rows = Int(rows)
    self.data = data.prefix(self.rows * self.stride)
  }
}
}
