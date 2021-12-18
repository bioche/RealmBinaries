// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let realmVersion = "10.20.1"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/bioche/RealmBinaries/releases/download/\(realmVersion)"
    
#if swift(>=5.5.2)
    let xcodeVersion = "13_2"
    let realmChecksum = "d4835551aca67af143bf4625effd1871b50bfd25352fc32c369aff2c103dd1f4"
    let realmSwiftChecksum = "41db3c8a529d114fd6d116fb28be3e6161d3fe608fb04f970844946b8bd3a302"
#else
    let xcodeVersion = "13_1"
    let realmChecksum = "f7b6d63a29d04b8fa51a366163701ed0bce2f8e0ef696aededa2918bc302bd83"
    let realmSwiftChecksum = "a70101578af77948e628c8e436eeecaf312deb48b9d6b262cc1ffa036bd2b7d2"
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
