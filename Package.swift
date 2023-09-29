// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CodeMasterTextView",
    platforms: [.macOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CodeMasterTextView",
            targets: ["CodeMasterTextView"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/krzyzanowskim/STTextView.git",
            exact: "0.8.7"
        ),
        /*.package(
            url: "https://github.com/CodeMasterApp/CodeMasterLanguages.git",
            from: "main"
        ),*/
        .package(
            url: "https://github.com/lukepistrol/SwiftLintPlugin",
            from: "0.2.2"
        ),
        .package(
            url: "https://github.com/ChimeHQ/TextFormation",
            from: "0.7.0"
        )
    ],
    targets: [
            .target(
                name: "CodeMasterTextView",
                dependencies: [
                    "STTextView",
//                    "CodeMasterLanguages",
                    "TextFormation",
                    .product(name: "STTextKitPlus", package: "STTextView")
                ],
                plugins: [
                    .plugin(name: "SwiftLint", package: "SwiftLintPlugin")
                ]
            ),

            .testTarget(
                name: "CodeMasterTextViewTests",
                dependencies: [
                    "CodeMasterTextView",
//                    "CodeMasterLanguages",
                ]
            ),
        ]
)
