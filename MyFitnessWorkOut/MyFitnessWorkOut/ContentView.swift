//
//  ContentView.swift
//  MyFitnessWorkOut
//
//  Created by 1101249 on 9/20/22.
//

import SwiftUI
import ComposableArchitecture

struct State: Equatable {
    var counter = 0
}

enum Action: Equatable {
    case increase
    case decrease
}

struct Environment {
    //Future Dependencies...
}

let reducer = Reducer<State, Action, Environment> { state,  action, environment in
    switch action {
    case .increase:
        state.counter += 1
        return Effect.none
    case .decrease:
        state.counter -= 1
        return Effect.none
    }
}

struct ContentView: View {
    let store: Store<State, Action> = Store(initialState: State(), reducer: reducer, environment: Environment())

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
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
