// Copyright © 2021 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3

import CWinRT

extension SystemIdentificationSource {
  public static var none: SystemIdentificationSource {
    SystemIdentificationSource_None
  }

  public static var tpm: SystemIdentificationSource {
    SystemIdentificationSource_Tpm
  }

  public static var uefi: SystemIdentificationSource {
    SystemIdentificationSource_Uefi
  }

  public static var registry: SystemIdentificationSource {
    SystemIdentificationSource_Registry
  }
}
