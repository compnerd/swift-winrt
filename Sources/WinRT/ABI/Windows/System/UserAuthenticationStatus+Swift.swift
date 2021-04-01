// Copyright © 2021 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3

import CWinRT

extension UserAuthenticationStatus {
  public static var unauthenticated: UserAuthenticationStatus {
    UserAuthenticationStatus_Unauthenticated
  }

  public static var locallyAuthenticated: UserAuthenticationStatus {
    UserAuthenticationStatus_LocallyAuthenticated
  }

  public static var remotelyAuthenticated: UserAuthenticationStatus {
    UserAuthenticationStatus_RemotelyAuthenticated
  }
}
