import ProjectDescription

let project = Project(
    name: "MyFitnessWorkOut",
    organizationName: "Daeun",
    targets: [
        Target(
            name: "MyFitnessWorkOut",
            platform: .iOS,
            product: .app,
            bundleId: "com.daeun.MyFitnessWorkOut",
            infoPlist: .extendingDefault(with: [:]),
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: [
                .external(name: "SnapKit"),
                .external(name: "ComposableArchitecture"),
            ]
        ),
        Target(
            name: "MyFitnessWorkOutTests",
            platform: .iOS,
            product: .unitTests,
            bundleId: "com.daeun.MyFitnessWorkOutTests",
            infoPlist: .extendingDefault(with: [:]),
            sources: ["Tests/**"],
            dependencies: [
                .target(name: "MyFitnessWorkOut")
            ]
        )
    ]
)
