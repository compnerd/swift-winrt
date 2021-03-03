/**
 * Copyright © 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

extension Metadata.Tables {
internal struct TypeSpec: Table {
  /// Record Layout
  ///   Signature (Blob Heap Index)
  typealias RecordLayout = (Signature: Int, ())

  let layout: RecordLayout
  let stride: Int
  let rows: Int
  let data: ArraySlice<UInt8>

  public static var number: Int { 27 }

  public init(from data: ArraySlice<UInt8>, rows: UInt32, strides: [TableIndex:Int]) {
    self.layout = (strides[.blob]!, ())
    self.stride = strides[.blob]!

    self.rows = Int(rows)
    self.data = data.prefix(self.rows * self.stride)
  }
}
}
