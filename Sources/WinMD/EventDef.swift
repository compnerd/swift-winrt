/**
 * Copyright © 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

extension Metadata.Tables {
internal struct EventDef: Table {
  /// Record Layout
  ///   EventFlags (2-byte bitmask EventAttributes)
  ///   Name (String Heap Index)
  ///   EventType (TypeDefOrRef Coded Index)
  typealias RecordLayout = (EventFlags: Int, Name: Int, EventType: Int)

  let layout: RecordLayout
  let stride: Int
  let rows: Int
  let data: ArraySlice<UInt8>

  public static var number: Int { 20 }

  public init(from data: ArraySlice<UInt8>, rows: UInt32, strides: [TableIndex:Int]) {
    self.layout = (2, strides[.string]!, strides[TypeDefOrRef.self]!)
    self.stride = WinMD.stride(of: self.layout)

    self.rows = Int(rows)
    self.data = data.prefix(self.rows * self.stride)
  }
}
}
