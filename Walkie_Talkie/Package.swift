//
//  Package.swift
//  Walkie_Talkie
//
//  Created by Nathan Wang on 4/20/25.
//

// swift-tools-version:4.2

// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "Walkie_Talkie",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(name: "Walkie_Talkie", targets: ["Walkie_Talkie"])
    ],
    dependencies: [
        .package(url: "https://github.com/socketio/socket.io-client-swift", from: "16.1.1")
    ],
    targets: [
        .target(
            name: "Walkie_Talkie",
            dependencies: [
                .product(name: "SocketIO", package: "socket.io-client-swift")
            ],
            path: "Sources"
        )
    ]
)
//import PackageDescription
//
//let package = Package(
//    name: "socket.io-test",
//    products: [
//        .executable(name: "socket.io-test", targets: ["Walkie_Talkie"])
//    ],
//    dependencies: [
//        .package(url: "https://github.com/socketio/socket.io-client-swift", .upToNextMinor(from: "16.1.1"))
//    ],
//    targets: [
//        .target(name: "Walkie_Talkie", dependencies: ["SocketIO"], path: "./Path/To/Your/Sources")
//    ]
//)

