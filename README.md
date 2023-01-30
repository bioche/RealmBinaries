# RealmBinaries
Vends Realm xcframeworks via SPM to save build time

How to release a new version :
- Download from https://github.com/realm/realm-swift/releases last release artefacts realm-swift-<Realm version>.zip 
- It should contain multiple xcode versions of Realm & RealmSwift xcframeworks
- Compress & rename the last 2 versions of these frameworks (ex : "Realm_13_4_1.xcframework.zip", "RealmSwift_13_4_1.xcframework.zip", "Realm_14_0.xcframework.zip", "RealmSwift_14_0.xcframework.zip")
- Run swift package compute-checksum <path> from this repo folder for each of the 4 zips
- In Package.swift :
    - Update `realmVersion` variable value to new Realm version (ex: "10.34.1")
    - Replace swift version with version from current XCode (found here https://xcodereleases.com/)
    - Replace xcode version & checksums
    - Update iOS/macOS/watchOS/tvOS handled versions if Realm handled versions changed 
- Push, tag with the same version number as original repo & upload all 4 zips as assets of the release
