// Copyright © 2021 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3

import WinRT

@main
class WinRTAsyncDemo {
  public static func main() async throws {
    try RoInitialize()

    let controller: IDispatcherQueueController =
        try Windows.System.DispatcherQueueController.CreateOnDedicatedThread()

    try await controller.ShutdownQueue()

    print("Done!")
  }
}
