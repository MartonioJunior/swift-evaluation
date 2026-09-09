// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// MARK: - Utilities
public enum UpcomingFeatures: String, CaseIterable {
    case existentialAny
    case fullTypedThrows
    case internalImportsByDefault
    case memberImportVisibility
    case nonescapableTypes
    case nonisolatedNonsendingByDefault
    case inferIsolatedConformances
    case valueGenerics
    case immutableWeakCaptures

    var asSetting: SwiftSetting { .enableUpcomingFeature(rawValue.prefix(1).uppercased() + rawValue.dropFirst()) }
}

public extension Array where Element == SwiftSetting {
    static var upcomingFeatures: Self { UpcomingFeatures.allCases.map(\.asSetting) }
}

func platformDeps(_ platforms: SupportedPlatform...) -> [SupportedPlatform] {
    platforms
}

func targetDep(name: String, package: String, condition: TargetDependencyCondition? = nil) -> Target.Dependency {
    .product(name: name, package: package, condition: condition)
}

// MARK: - Traits
var traits: Set<Trait> = []

traits.insert(
    .default(enabledTraits: Set(traits.map(\.name)))
)

// MARK: - Dependencies
let customDump = targetDep(name: "CustomDump", package: "swift-custom-dump")

let dependencies: [Package.Dependency] = [
    .package(url: "https://github.com/pointfreeco/swift-custom-dump", .upToNextMajor(from: "1.7.3"))
]

// MARK: - Targets
let targets: [Target] = [
    .target(
        name: "Evaluation",
        dependencies: [customDump],
        swiftSettings: .upcomingFeatures
    )
]

let testTargets: [Target] = targets.map { t in
    .testTarget(name: "\(t.name)Tests", dependencies: [Target.Dependency(stringLiteral: t.name)] + t.dependencies)
}

// MARK: - Products
let products: [Product] = [
    .library(
        name: "Evaluation",
        targets: ["Evaluation"]
    )
]

// MARK: - Supported Platforms
let platforms: [SupportedPlatform] = [
    .macOS(.v10_15),
    .iOS(.v13),
    .watchOS(.v5),
    .tvOS(.v13)
]

// MARK: - PackageDescription
let package = Package(
    name: "Evaluation",
    platforms: platforms,
    products: products,
    dependencies: dependencies,
    targets: targets + testTargets,
    swiftLanguageModes: [.v6]
)
