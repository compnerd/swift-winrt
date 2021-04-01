// Copyright © 2021 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3

import CWinRT

@_transparent
private var IID___x_ABI_CWindows_CSecurity_CCryptography_CICryptographicBufferStatics: IID {
  IID(Data1: 0x320b7e22, Data2: 0x3cb0, Data3: 0x4cdf,
      Data4: (0x86, 0x63, 0x1d, 0x28, 0x91, 0x00, 0x65, 0xeb))
}

public class ICryptographicBufferStatics: IInspectable {
  override public class var IID: IID { IID___x_ABI_CWindows_CSecurity_CCryptography_CICryptographicBufferStatics }

  public func Compare(_ object1: UnsafeMutablePointer<__x_ABI_CWindows_CStorage_CStreams_CIBuffer>?, _ object2: UnsafeMutablePointer<__x_ABI_CWindows_CStorage_CStreams_CIBuffer>?, _ isEqual: UnsafeMutablePointer<boolean>?) throws {
    return try perform(as: __x_ABI_CWindows_CSecurity_CCryptography_CICryptographicBufferStatics.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.Compare(pThis, object1, object2, isEqual))
    }
  }

  public func GenerateRandom(_ length: UINT32, _ buffer: UnsafeMutablePointer<UnsafeMutablePointer<__x_ABI_CWindows_CStorage_CStreams_CIBuffer>?>?) throws {
    return try perform(as: __x_ABI_CWindows_CSecurity_CCryptography_CICryptographicBufferStatics.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.GenerateRandom(pThis, length, buffer))
    }
  }

  public func GenerateRandomNumber(_ value: UnsafeMutablePointer<UINT32>?) throws {
    return try perform(as: __x_ABI_CWindows_CSecurity_CCryptography_CICryptographicBufferStatics.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.GenerateRandomNumber(pThis, value))
    }
  }

  public func CreateFromByteArray(_ valueLength: UINT32, _ value: UnsafeMutablePointer<BYTE>?, _ buffer: UnsafeMutablePointer<UnsafeMutablePointer<__x_ABI_CWindows_CStorage_CStreams_CIBuffer>?>?) throws {
    return try perform(as: __x_ABI_CWindows_CSecurity_CCryptography_CICryptographicBufferStatics.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.CreateFromByteArray(pThis, valueLength, value, buffer))
    }
  }

  public func DecodeFromHexString(_ value: HSTRING?, _ buffer: UnsafeMutablePointer<UnsafeMutablePointer<__x_ABI_CWindows_CStorage_CStreams_CIBuffer>?>?) throws {
    return try perform(as: __x_ABI_CWindows_CSecurity_CCryptography_CICryptographicBufferStatics.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.DecodeFromHexString(pThis, value, buffer))
    }
  }

  public func EncodeToHexString(_ buffer: UnsafeMutablePointer<__x_ABI_CWindows_CStorage_CStreams_CIBuffer>?, _ value: UnsafeMutablePointer<HSTRING?>?) throws {
    return try perform(as: __x_ABI_CWindows_CSecurity_CCryptography_CICryptographicBufferStatics.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.EncodeToHexString(pThis, buffer, value))
    }
  }

  public func DecodeFromBase64String(_ value: HSTRING?, _ buffer: UnsafeMutablePointer<UnsafeMutablePointer<__x_ABI_CWindows_CStorage_CStreams_CIBuffer>?>?) throws {
    return try perform(as: __x_ABI_CWindows_CSecurity_CCryptography_CICryptographicBufferStatics.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.DecodeFromBase64String(pThis, value, buffer))
    }
  }

  public func EncodeToBase64String(_ buffer: UnsafeMutablePointer<__x_ABI_CWindows_CStorage_CStreams_CIBuffer>?, _ value: UnsafeMutablePointer<HSTRING?>?) throws {
    return try perform(as: __x_ABI_CWindows_CSecurity_CCryptography_CICryptographicBufferStatics.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.EncodeToBase64String(pThis, buffer, value))
    }
  }

  public func ConvertStringToBinary(_ value: HSTRING?, _ encoding: __x_ABI_CWindows_CSecurity_CCryptography_CBinaryStringEncoding, _ buffer: UnsafeMutablePointer<UnsafeMutablePointer<__x_ABI_CWindows_CStorage_CStreams_CIBuffer>?>?) throws {
    return try perform(as: __x_ABI_CWindows_CSecurity_CCryptography_CICryptographicBufferStatics.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.ConvertStringToBinary(pThis, value, encoding, buffer))
    }
  }

  public func ConvertBinaryToString(_ encoding: __x_ABI_CWindows_CSecurity_CCryptography_CBinaryStringEncoding, _ buffer: UnsafeMutablePointer<__x_ABI_CWindows_CStorage_CStreams_CIBuffer>?, _ value: UnsafeMutablePointer<HSTRING?>?) throws {
    return try perform(as: __x_ABI_CWindows_CSecurity_CCryptography_CICryptographicBufferStatics.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.ConvertBinaryToString(pThis, encoding, buffer, value))
    }
  }
}
