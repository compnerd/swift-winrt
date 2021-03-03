/**
 * Copyright © 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

extension Metadata.Tables {
internal struct AssemblyRef: Table {
  /// Record Layout
  ///   MajorVersion (2-byte value)
  ///   MinorVersion (2-byte value)
  ///   BuildNumber (2-byte value)
  ///   RevisionNumber (2-byte value)
  ///   Flags (4-byte value, CorAssemblyFlags)
  ///   PublicKeyOrToken (Blob Heap Index)
  ///   Name (String Heap Index)
  ///   Culture (String Heap Index)
  ///   HashValue (Blob Heap Index)
  typealias RecordLayout = (MajorVersion: Int, MinorVersion: Int, BuildNumber: Int, RevisionNumber: Int, Flags: Int, PublicKeyOrToken: Int, Name: Int, Culture: Int, HashValue: Int)

  let layout: RecordLayout
  let stride: Int
  let rows: Int
  let data: ArraySlice<UInt8>

  public static var number: Int { 35 }

  public init(from data: ArraySlice<UInt8>, rows: UInt32, strides: [TableIndex:Int]) {
    self.layout = (2, 2, 2, 2, 4, strides[.blob]!, strides[.string]!, strides[.string]!, strides[.blob]!)
    self.stride = WinMD.stride(of: self.layout)

    self.rows = Int(rows)
    self.data = data.prefix(self.rows * self.stride)
  }
}
}
