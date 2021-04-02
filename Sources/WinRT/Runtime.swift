// Copyright © 2021 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3

import CWinRT

@_transparent
public var RuntimeClass_Windows_System_DispatcherQueueController: String {
  return withUnsafeBytes(of: CWinRT.RuntimeClass_Windows_System_DispatcherQueueController) {
    String(decodingCString: $0.baseAddress!.assumingMemoryBound(to: UTF16.CodeUnit.self),
           as: UTF16.self)
  }
}

@_transparent
public var RuntimeClass_Windows_System_Profile_SystemIdentification: String {
  return withUnsafeBytes(of: CWinRT.RuntimeClass_Windows_System_Profile_SystemIdentification) {
    String(decodingCString: $0.baseAddress!.assumingMemoryBound(to: UTF16.CodeUnit.self),
           as: UTF16.self)
  }
}

@_transparent
public var RuntimeClass_Windows_Security_Cryptography_CryptographicBuffer: String {
  return withUnsafeBytes(of: CWinRT.RuntimeClass_Windows_Security_Cryptography_CryptographicBuffer) {
    String(decodingCString: $0.baseAddress!.assumingMemoryBound(to: UTF16.CodeUnit.self),
           as: UTF16.self)
  }
}
