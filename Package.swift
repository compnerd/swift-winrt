// swift-tools-version:5.3

import PackageDescription

let SwiftWinRT = Package(
  name: "SwiftWinRT",
  products: [
    .executable(name: "WinRTDemo", targets: ["WinRTDemo"]),
    .library(name: "SwiftWinRT", type: .dynamic, targets: ["WinRT"]),
  ],
  targets: [
    .target(name: "CWinRT"),
    .target(name: "WinRT", dependencies: ["CWinRT"],
            linkerSettings: [
              .linkedLibrary("Ole32"),
            ]),
    .target(name: "WinRTDemo", dependencies: ["WinRT"],
            swiftSettings: [
              .unsafeFlags(["-parse-as-library"]),
            ]),
  ]
)
