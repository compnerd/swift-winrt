/**
 * Copyright © 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

internal protocol TableBase {
  /// The CIL defined table number.
  static var number: Int { get }

  /// The stride of a single row.
  var stride: Int { get }

  /// The number of rows in the table.
  var rows: Int { get }

  /// The data backing the table model.
  var data: ArraySlice<UInt8> { get }

  /// Constructs a new table model.
  init(from data: ArraySlice<UInt8>, rows: UInt32, strides: [TableIndex:Int])
}

internal protocol Table: TableBase, Sequence, CustomStringConvertible {
  /// Defines the layout of the record (width of columns).
  associatedtype RecordLayout

  /// The layout of a record in the table.
  var layout: RecordLayout { get }
}

extension Table {
  internal var description: String {
    "\(String(describing: Self.self)): rows: \(self.rows), stride: \(self.stride) bytes, data: \(self.data.count) bytes"
  }
}

extension Table {
  @inlinable
  internal __consuming func makeIterator() -> Row<Self> {
    return Row(table: self)
  }
}
