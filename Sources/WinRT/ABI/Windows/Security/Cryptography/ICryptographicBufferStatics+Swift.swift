// Copyright © 2021 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3

import CWinRT

extension ICryptographicBufferStatics {
  public func Compare(_ object1: IBuffer, _ object2: IBuffer) throws -> Bool {
    var isEqual: boolean = 0
    try self.Compare(RawPointer(object1), RawPointer(object2), &isEqual)
    return isEqual != 0
  }

  public func GenerateRandom(_ length: UINT32) throws -> IBuffer {
    var buffer: UnsafeMutablePointer<__x_ABI_CWindows_CStorage_CStreams_CIBuffer>?
    try self.GenerateRandom(length, &buffer)
    return IBuffer(consuming: buffer)
  }

  public func GenerateRandomNumber() throws -> UINT32 {
    var value: UINT32 = 0
    try self.GenerateRandomNumber(&value)
    return value
  }

  public func CreateFromByteArray(_ array: [BYTE]) throws -> IBuffer {
    var array = array
    return try array.withUnsafeMutableBufferPointer {
      var buffer: UnsafeMutablePointer<__x_ABI_CWindows_CStorage_CStreams_CIBuffer>?
      try self.CreateFromByteArray(UINT32($0.count), $0.baseAddress, &buffer)
      return IBuffer(consuming: buffer)
    }
  }

  public func DecodeFromHexString(_ value: String) throws -> IBuffer {
    let hString: HString = try HString(value)
    return try withExtendedLifetime(hString) {
      var buffer: UnsafeMutablePointer<__x_ABI_CWindows_CStorage_CStreams_CIBuffer>?
      try self.DecodeFromHexString(hString.hRef.hString, &buffer)
      return IBuffer(consuming: buffer)
    }
  }

  public func EncodeToHexString(_ buffer: IBuffer) throws -> String {
    var value: HSTRING?
    try self.EncodeToHexString(RawPointer(buffer), &value)
    return String(from: value!)
  }

  public func DecodeFromBase64String(_ value: String) throws -> IBuffer {
    let hString: HString = try HString(value)
    return try withExtendedLifetime(hString) {
      var buffer: UnsafeMutablePointer<__x_ABI_CWindows_CStorage_CStreams_CIBuffer>?
      try self.DecodeFromBase64String(hString.hRef.hString, &buffer)
      return IBuffer(consuming: buffer)
    }
  }

  public func EncodeToBase64String(_ buffer: IBuffer) throws -> String {
    var value: HSTRING?
    try self.EncodeToBase64String(RawPointer(buffer), &value)
    return String(from: value!)
  }

  public func ConvertStringToBinary(_ value: String, _ encoding: BinaryStringEncoding) throws -> IBuffer {
    let hString: HString = try HString(value)
    return try withExtendedLifetime(hString) {
      var buffer: UnsafeMutablePointer<__x_ABI_CWindows_CStorage_CStreams_CIBuffer>?
      try self.ConvertStringToBinary(hString.hRef.hString, encoding, &buffer)
      return IBuffer(consuming: buffer)
    }
  }

  public func ConvertBinaryToString(_ encoding: BinaryStringEncoding, _ buffer: IBuffer) throws -> String {
    var value: HSTRING?
    try self.ConvertBinaryToString(__x_ABI_CWindows_CSecurity_CCryptography_CBinaryStringEncoding(rawValue: encoding.rawValue), RawPointer(buffer), &value)
    return String(from: value!)
  }
}
