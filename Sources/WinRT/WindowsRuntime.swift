// Copyright © 2021 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3

public enum Windows {
  public enum Security {
    public enum Cryptography {
      private struct Statics {
        static var CryptographicBuffer: ICryptographicBufferStatics =
            try! RoGetActivationFactory(HString(RuntimeClass_Windows_Security_Cryptography_CryptographicBuffer))
      }

      public static var CryptographicBuffer: ICryptographicBufferStatics {
        Statics.CryptographicBuffer
      }
    }
  }

  public enum System {
    public enum Profile {
      private struct Statics {
        static var SystemIdentification: ISystemIdentificationStatics =
            try! RoGetActivationFactory(HString(RuntimeClass_Windows_System_Profile_SystemIdentification))
      }

      public static var SystemIdentification: ISystemIdentificationStatics {
        Statics.SystemIdentification
      }
    }
  }
}
