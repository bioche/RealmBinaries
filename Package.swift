// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let realmVersion = "10.24.2"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/bioche/RealmBinaries/releases/download/\(realmVersion)"
    
#if swift(>=5.6.0)
    let xcodeVersion = "13_3"
    let realmChecksum = "c2ca70d6826a6f8c52a5c2b7f45ebeb3a21d0679e6f91bed76dbf5b409a34249"
    let realmSwiftChecksum = "0fa96eefe4ea1025d6f9eb2293cedd8bc38fd626dce4ea4c98dbf41432b6253d"
#else
    let xcodeVersion = "13_2_1"
    let realmChecksum = "689981e46b095b55e1806f7cbeb169ebfc385412f13fe59e7e460fa566c1f1fe"
    let realmSwiftChecksum = "2dbba6714cfbdb1f698fbde0eb8e1dd43013b3a53a36a6b2469db21ea8534db8"
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
