//
//  SplashIntroView.swift
//  MyFitnessWorkOut
//
//  Created by 1101249 on 9/29/22.
//

import SwiftUI
import Lottie
import UIKit
import ComposableArchitecture


struct SplashState: Equatable {
    var isActive = false
    var viewOpacity = 1.0
}

enum SplashAction: Equatable {
    case loadingCompleted
}

struct SplashEnvironment { }


let splashReducer = Reducer<SplashState, SplashAction, SplashEnvironment> {
    state, action, environment in
    switch action {
    case .loadingCompleted:
        state.isActive = true
        state.viewOpacity = 0
        return Effect.none
    }
}


struct LottieView: UIViewRepresentable {
    var name: String
    var loopMode: LottieLoopMode
    
    init(jsonName: String = "", loopMode: LottieLoopMode = .loop) {
        self.name = jsonName
        self.loopMode = loopMode
    }
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView(frame: .zero)
        
        let animationView = AnimationView()
        let animation = Animation.named(name)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.play()
        animationView.backgroundBehavior = .pauseAndRestore
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) { }
}


struct SplashIntroView: View {
    let store: Store<SplashState, SplashAction>

    var body: some View {
        WithViewStore(self.store) { viewStore in
        
            if viewStore.isActive {
                MainHomeView()
            } else {
                VStack {
                    LottieView(jsonName: "exercise", loopMode: .loop)
                        .padding(10)
                    Text("My FitnessWorkOut")
                        .fontWeight(.heavy)
                        .font(.headline)
                }
                .frame(width: 220, height: 220, alignment: .center)
                .opacity(viewStore.viewOpacity)
                .onAppear {
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        viewStore.send(.loadingCompleted, animation: Animation.easeIn(duration: 1.0))
                    }
                }
            }
        }
    }
}
    
struct SplashIntroView_Previews: PreviewProvider {
    static var previews: some View {
        SplashIntroView(store: Store(initialState: SplashState(), reducer: splashReducer, environment: SplashEnvironment()))
    }
}
