//
//  ContentView.swift
//  MyFitnessWorkOut
//
//  Created by 1101249 on 9/20/22.
//

import SwiftUI
import ComposableArchitecture

struct TestFeature: ReducerProtocol {
    struct State: Equatable {
        var counter = 0
        var activeDecrease = false
        var activeIncrease = true
    }

    enum Action: Equatable {
        case increase
        case decrease
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action, Never> {
        switch action {
        case .increase:
            state.counter += 1
            state.activeIncrease = state.counter < 10
            state.activeDecrease = state.counter != 0
            return .none
        case .decrease:
            state.counter = max(0, state.counter - 1)
            state.activeIncrease = state.counter < 100
            state.activeDecrease = state.counter != 0
            return .none
        }
    }
}


struct ContentView: View {
    let store: StoreOf<TestFeature>

    var body: some View {
        WithViewStore(self.store) { viewStore in
            HStack {
                Button {
                    viewStore.send(.decrease)
                } label: {
                    Text("-")
                        .padding(10)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .buttonStyle(.plain)
                .disabled(!viewStore.activeDecrease)
                Text("\(viewStore.counter)")
                    .padding(5)
                Button {
                    viewStore.send(.increase)
                } label: {
                    Text("+")
                        .padding(10)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .buttonStyle(.plain)
                .disabled(!viewStore.activeIncrease)
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: Store(initialState: TestFeature.State(), reducer: TestFeature())).preferredColorScheme(.dark)
    }
}
