/**
 * Copyright © 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

extension Metadata.Tables {
internal struct CustomAttribute: Table {
  /// Record Layout
  ///   Parent (HasCustomAttribute Coded Index)
  ///   Type (CustomAttributeType Coded Index)
  ///   Value (Blob Heap Index)
  typealias RecordLayout = (Parent: Int, Type: Int, Value: Int)

  let layout: RecordLayout
  let stride: Int
  let rows: Int
  let data: ArraySlice<UInt8>

  public static var number: Int { 12 }

  public init(from data: ArraySlice<UInt8>, rows: UInt32, strides: [TableIndex:Int]) {
    self.layout = (strides[HasCustomAttribute.self]!, strides[CustomAttributeType.self]!, strides[.blob]!)
    self.stride = WinMD.stride(of: self.layout)

    self.rows = Int(rows)
    self.data = data.prefix(self.rows * self.stride)
  }
}
}
