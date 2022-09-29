//
//  MyFitnessWorkOutApp.swift
//  MyFitnessWorkOut
//
//  Created by 1101249 on 9/20/22.
//

import SwiftUI
import ComposableArchitecture

@main
struct MyFitnessWorkOutApp: App {
    var body: some Scene {
        WindowGroup {
            SplashIntroView(store: Store(initialState: SplashState(), reducer: splashReducer, environment: SplashEnvironment(actionQueue: .main)))
        }
    }
}
