/**
 * Copyright © 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

extension Metadata.Tables {
internal struct Assembly: Table {
  /// Record Layout
  ///   HashAlgId (4-byte constant of type AssemblyHashAlgorithm)
  ///   MajorVersion (2-byte constant)
  ///   MinorVersion (2-byte constant)
  ///   BuildNumber (2-byte constant)
  ///   RevisionNumber (2-byte constant)
  ///   Flags (4-byte bitmask of type AssemblyFlags)
  ///   PublicKey (Blob Heap Index)
  ///   Name (String Heap Index)
  ///   Culture (String Heap Index)
  typealias RecordLayout = (HashAlgId: Int, MajorVersion: Int, MinorVersion: Int, BuildNumber: Int, RevisionNumber: Int, Flags: Int, PublicKey: Int, Name: Int, Culture: Int)

  let layout: RecordLayout
  let stride: Int
  let rows: Int
  let data: ArraySlice<UInt8>

  public static var number: Int { 32 }

  public init(from data: ArraySlice<UInt8>, rows: UInt32, strides: [TableIndex:Int]) {
    self.layout = (4, 2, 2, 2, 2, 4, strides[.blob]!, strides[.string]!, strides[.string]!)
    self.stride = WinMD.stride(of: self.layout)

    self.rows = Int(rows)
    self.data = data.prefix(self.rows * self.stride)
  }
}
}
