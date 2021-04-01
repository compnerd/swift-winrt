// Copyright © 2021 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3

import CWinRT

extension UserType {
  public static var localUser: UserType {
    UserType_LocalUser
  }

  public static var remoteUser: UserType {
    UserType_RemoteUser
  }

  public static var localGuest: UserType {
    UserType_LocalGuest
  }

  public static var remoteGuest: UserType {
    UserType_RemoteGuest
  }
}
