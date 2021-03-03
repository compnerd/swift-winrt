/**
 * Copyright © 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

extension Dictionary where Key == TableIndex, Value == Int {
  internal subscript(_ table: TableBase.Type) -> Int? {
    get { return self[.simple(table)] }
    set { self[.simple(table)] = newValue }
  }

  internal subscript<T: CodedIndex>(_ index: T.Type) -> Int? {
    get { return self[.coded(ObjectIdentifier(index))] }
    set { self[.coded(ObjectIdentifier(index))] = newValue }
  }
}

extension Metadata {
  internal enum Tables {
  }
}

func scan<RecordLayout>(of layout: RecordLayout, length: Int) -> Int {
  return Mirror(reflecting: layout).children.lazy.prefix(length).map { $0.value as! Int }.reduce(0, +)
}

func stride<RecordLayout>(of layout: RecordLayout) -> Int {
  return Mirror(reflecting: layout).children.lazy.map { $0.value as! Int }.reduce(0, +)
}

extension Metadata.Tables {
  static func forEach(_ body: (TableBase.Type) -> Void) {
    _ = Array<TableBase.Type>([
      Assembly.self,
      AssemblyOS.self,
      AssemblyProcessor.self,
      AssemblyRef.self,
      AssemblyRefOS.self,
      AssemblyRefProcessor.self,
      ClassLayout.self,
      Constant.self,
      CustomAttribute.self,
      DeclSecurity.self,
      EventMap.self,
      EventDef.self,
      ExportedType.self,
      FieldDef.self,
      FieldLayout.self,
      FieldMarshal.self,
      FieldRVA.self,
      File.self,
      GenericParam.self,
      GenericParamConstraint.self,
      ImplMap.self,
      InterfaceImpl.self,
      ManifestResource.self,
      MemberRef.self,
      MethodDef.self,
      MethodImpl.self,
      MethodSemantics.self,
      MethodSpec.self,
      Module.self,
      ModuleRef.self,
      NestedClass.self,
      Param.self,
      PropertyDef.self,
      PropertyMap.self,
      StandAloneSig.self,
      TypeDef.self,
      TypeRef.self,
      TypeSpec.self,
    ]).sorted(by: { $0.number < $1.number }).map(body)
  }
}
