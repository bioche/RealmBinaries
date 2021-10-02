// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let realmVersion = "10.16.0"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/bioche/RealmBinaries/releases/download/\(realmVersion)"
    
    #if swift(>=5.5)
    let xcodeVersion = "13"
    let realmChecksum = "3904b4386ad260fab4e43d77c140458cce01e441e1f67cf28c3219df73634063"
    let realmSwiftChecksum = "1583230dd3d63fae97d7652b82e2c26338316932dee46fdd86a44f48ea4feb60"
    #else
    let xcodeVersion = "12_5_1"
    let realmChecksum = "b03c7517b6feff077bf7c2feae14663ff83a97d1c90893061599bac7c2adc072"
    let realmSwiftChecksum = "f79afb456e0bc23f5fe1dcda6268f998f81376e994a4a163445d327be5796dea"
    #endif
    
    return [
        .binaryTarget(
            name: "Realm",
            url: "\(baseURL)/Realm_\(xcodeVersion).xcframework.zip",
            checksum: realmChecksum
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "\(baseURL)/RealmSwift_\(xcodeVersion).xcframework.zip",
            checksum: realmSwiftChecksum
        )
    ]
}

let package = Package(
    name: "RealmBinaries",
    platforms: [.iOS("13.4")],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Realm",
            targets: ["Realm"]),
        .library(
            name: "RealmSwift",
            targets: ["RealmSwift"])
    ],
    targets: buildTargets()
)
