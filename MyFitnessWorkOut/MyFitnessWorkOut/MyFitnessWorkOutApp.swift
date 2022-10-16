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
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some Scene {
        WindowGroup {
            SplashIntroView(store: Store(initialState: SplashFeature.State(), reducer: SplashFeature()))
        }
    }
}
