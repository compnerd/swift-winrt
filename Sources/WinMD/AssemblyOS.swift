/**
 * Copyright © 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

extension Metadata.Tables {
internal struct AssemblyOS: Table {
  /// Record Layout
  ///   OSPlatformID (4-byte constant)
  ///   OSMajorVersion (4-byte constant)
  ///   OSMinorVersion (4-byte constant)
  typealias RecordLayout = (OSPlatformID: Int, OSMajorVersion: Int, OSMinorVersion: Int)

  let layout: RecordLayout
  let stride: Int
  let rows: Int
  let data: ArraySlice<UInt8>

  public static var number: Int { 34 }

  public init(from data: ArraySlice<UInt8>, rows: UInt32, strides: [TableIndex:Int]) {
    self.layout = (4, 4, 4)
    self.stride = WinMD.stride(of: self.layout)

    self.rows = Int(rows)
    self.data = data.prefix(self.rows * self.stride)
  }
}
}
