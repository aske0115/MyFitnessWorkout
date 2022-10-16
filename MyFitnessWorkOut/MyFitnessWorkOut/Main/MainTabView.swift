//
//  MainTabView.swift
//  MyFitnessWorkOut
//
//  Created by 1101249 on 10/14/22.
//

import SwiftUI
import ComposableArchitecture

struct MainTabFeature: ReducerProtocol {
    struct State: Equatable {
        var selection: Int = 2
    }
    
    enum Action: Equatable {
        case selectTab(Int)
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action, Never> {
        switch action {
        case .selectTab(let index):
            state.selection = index
            return .none
        }
    }
}

struct MainTabView: View {
    
    let store: StoreOf<MainTabFeature>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            TabView(selection: viewStore.binding(get:  \.selection, send: { .selectTab($0) })) {
                TabbarItem("요약", "stairs", tag: 0)
                TabbarItem("캘린더", "calendar", tag: 1)
                TabbarItem("루틴", "dumbbell", tag: 2)
                TabbarItem("피드", "magnifyingglass", tag: 3)
                TabbarItem("설정", "gearshape", tag: 4)
            }
            .onAppear() {
                let appearence = UITabBarAppearance()
                appearence.configureWithOpaqueBackground()
                appearence.backgroundColor = .black
                UITabBar.appearance().standardAppearance = appearence
            }
            .accentColor(.red)
        }
    }
}

@ViewBuilder
func TabbarItem(_ title: String, _ imageName: String, tag: Int) -> some View {
    if title == "설정" {
        SettingView(store: Store(initialState: SettingFeature.State(), reducer: SettingFeature()))
            .tabItem{
                Image(systemName: imageName)
                Text(title)
            }.tag(tag)
    } else {
        HomeView()
            .tabItem{
                Image(systemName: imageName)
                Text(title)
            }.tag(tag)
    }
}


struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(store: Store(initialState: MainTabFeature.State(), reducer: MainTabFeature()))
    }
}
