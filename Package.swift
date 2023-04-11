// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let realmVersion = "10.38.0"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/bioche/RealmBinaries/releases/download/\(realmVersion)"
    
#if swift(>=5.8.0)
    let xcodeVersion = "14_3"
    let realmChecksum = "b2fdbe49d326175af87be488f31533f6c2cb86a0b5c351264935133db2748ff6"
    let realmSwiftChecksum = "c3822a8f6743a0eef4fb4dd73dbc0f41f79bca655478deb06cd78676e8223264"
#else
    let xcodeVersion = "14_2"
    let realmChecksum = "befa150f03157fac25dd87e50a37618e3d006a9005e4a99b3a34f9237aa806de"
    let realmSwiftChecksum = "b16d19c62961ef15b8012b6155cd43ca43290dad8f7437950a07ff3645232d0c"
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
    platforms: [
        .macOS(.v10_10),
        .iOS(.v11),
        .tvOS(.v9),
        .watchOS(.v2)
    ],
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
