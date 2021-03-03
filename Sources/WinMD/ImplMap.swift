/**
 * Copyright © 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

extension Metadata.Tables {
internal struct ImplMap: Table {
  /// Record Layout
  ///   MappingFlags (2-byte bitmask of PInvokeAttributes)
  ///   MemberForwarded (MemberForwarded Coded Index)
  ///   ImportName (String Heap Index)
  ///   ImportScope (ModuleRef Index)
  typealias RecordLayout = (MappingFlags: Int, MemberForwarded: Int, ImportName: Int, ImportScope: Int)

  let layout: RecordLayout
  let stride: Int
  let rows: Int
  let data: ArraySlice<UInt8>

  public static var number: Int { 28 }

  public init(from data: ArraySlice<UInt8>, rows: UInt32, strides: [TableIndex:Int]) {
    self.layout = (2, strides[MemberForwarded.self]!, strides[.string]!, strides[ModuleRef.self]!)
    self.stride = WinMD.stride(of: self.layout)

    self.rows = Int(rows)
    self.data = data.prefix(self.rows * self.stride)
  }
}
}
