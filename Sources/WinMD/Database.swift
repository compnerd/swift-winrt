/**
 * Copyright © 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import struct Foundation.Data
import struct Foundation.URL

public class Database {
  private let dos: DOSFile
  private let pe: PEFile
  private let cil: Assembly

  private init(data: [UInt8]) throws {
    self.dos = try DOSFile(from: data)
    self.pe = try PEFile(from: self.dos)
    self.cil = try Assembly(from: self.pe)
  }

  public convenience init(at path: URL) throws {
    // Although it is inconvenient to read data from a file without using
    // `Data`, once the data has been read, it is usually easier to work with a
    // byte array representation.  Unfortunately, this conversion is likely to
    // incur a pointless copy.
    try self.init(data: Array(Data(contentsOf: path, options: .alwaysMapped)))
  }

  public func dump() {
    let metadata = self.cil.Metadata

    print("Version: \(metadata.Version)")
    print("Streams: \(metadata.Streams)")
    metadata.StreamHeaders.forEach { print("  - \($0)") }

    if let TableStream = metadata.stream(named: Metadata.Stream.Tables),
        let BlobStream = metadata.stream(named: Metadata.Stream.Blob),
        let GUIDSteam = metadata.stream(named: Metadata.Stream.GUID),
        let StringStream = metadata.stream(named: Metadata.Stream.Strings) {
      let tables = TablesStream(data: TableStream)
      let strings = StringsHeap(data: StringStream)
      let guids = GUIDHeap(data: GUIDSteam)
      let blobs = BlobsHeap(data: BlobStream)

      print("MajorVersion: \(String(tables.MajorVersion, radix: 16))")
      print("MinorVersion: \(String(tables.MinorVersion, radix: 16))")
      print("Tables:")
      tables.Tables.forEach {
        print("  - \($0)")
        switch $0 {
        case let Module as Metadata.Tables.Module:
          Module.forEach {
            print("    - \($0.Generation), \(strings[$0.Name]), \(guids[$0.Mvid]), \($0.EncId), \($0.EncBaseId)")
          }
        case let TypeRef as Metadata.Tables.TypeRef:
          TypeRef.forEach {
            print("    - \($0.ResolutionScope), \(strings[$0.TypeName]), \(strings[$0.TypeNamespace])")
          }
        case let TypeDef as Metadata.Tables.TypeDef:
          TypeDef.forEach {
            print("    - \($0.Flags), \(strings[$0.TypeName]), \(strings[$0.TypeNamespace]), \($0.Extends), \($0.FieldList), \($0.MethodList)")
          }
        case let FieldDef as Metadata.Tables.FieldDef:
          FieldDef.forEach {
            print("    - \($0.Flags), \(strings[$0.Name]), \(blobs[$0.Signature])")
          }
        case let MethodDef as Metadata.Tables.MethodDef:
          MethodDef.forEach {
            print("    - 0x\(String($0.RVA, radix: 16)), \($0.ImplFlags), \($0.Flags), \(strings[$0.Name]), \($0.Signature), \($0.ParamList)")
          }
        case let Param as Metadata.Tables.Param:
          Param.forEach {
            print("    - \($0.Flags), \($0.Sequence), \(strings[$0.Name])")
          }
        case let InterfaceImpl as Metadata.Tables.InterfaceImpl:
          InterfaceImpl.forEach {
            print("    - \($0.Class), \($0.Interface)")
          }
        case let MemberRef as Metadata.Tables.MemberRef:
          MemberRef.forEach {
            print("    - \($0.Class), \(strings[$0.Name]), \($0.Signature)")
          }
        default:
          break
        }
      }
    }
  }
}
