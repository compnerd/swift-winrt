/**
 * Copyright © 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

@dynamicMemberLookup
internal struct Row<Table: WinMD.Table> {
  internal var table: Table
  internal var cursor: Int

  internal let record: [Int]

  internal init(table: Table, row: Int = 0) {
    self.table = table
    self.cursor = row

    let begin: ArraySlice<UInt8>.Index =
        self.table.data.index(self.table.data.startIndex,
                              offsetBy: self.cursor * self.table.stride)
    let end: ArraySlice<UInt8>.Index =
        self.table.data.index(begin, offsetBy: self.table.stride)

    let data: ArraySlice<UInt8> = self.table.data[begin ..< end]
    let fields = Mirror(reflecting: self.table.layout).children
    self.record =
      (0 ..< fields.count).map { index -> Int in
        switch fields[AnyIndex(index)].value as! Int {
        case 2:
          return Int(data[scan(of: table.layout, length: index), UInt16.self])
        case 4:
          return Int(data[scan(of: table.layout, length: index), UInt32.self])
        default:
          fatalError("unhandled column width: \(fields[AnyIndex(index)].value as! Int)")
        }
      }
  }

  internal subscript(dynamicMember field: String) -> Int {
    let fields = Mirror(reflecting: self.table.layout).children
    return self.record[fields.distance(from: fields.startIndex, to: fields.firstIndex(where: { ($0.label ?? "") == field })!)]
  }
}

extension Row: IteratorProtocol {
  internal mutating func next() -> Self? {
    guard self.cursor < self.table.rows else { return nil }
    defer { self.cursor += 1 }
    return Self(table: table, row: self.cursor)
  }
}
