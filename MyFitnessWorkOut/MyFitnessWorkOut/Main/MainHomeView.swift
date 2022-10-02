//
//  MainHomeView.swift
//  MyFitnessWorkOut
//
//  Created by 1101249 on 10/2/22.
//

import SwiftUI
import ComposableArchitecture

struct MainHomeView: View {
    var body: some View {
        NavigationView {
            GeometryReader { g in
                ScrollView (.vertical, showsIndicators: false){
                    VStack(alignment: .leading) {
                        Button(action: {}) {
                            Text("에")
                                .frame(width: 30, height: 30, alignment: .center)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(.white, lineWidth: 1)
                                }
                        }
                        .padding([.top, .bottom], 10)
                        Button(action: {}) {
                            Image("141")
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 100, height: 100)
                                .overlay(Circle().stroke(Color.white,lineWidth:2).shadow(radius: 10))
      
                        }
                        ForEach(0..<50) { row in
                            Button {
                                print(row)
                            } label: {
                                Text("row = \(row)")
                            }
                        }
                    }
                    .padding([.top, .leading], 10)
                    .frame(width: g.size.width, height: .infinity, alignment: .topLeading)
                }
                .frame(width: g.size.width - 20, height: g.size.height, alignment: .topLeading)
                .padding([.leading], 10)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button (action: {}) {
                        Image(systemName: "folder")
                    }
                    .buttonStyle(.automatic)
                }
                ToolbarItem(placement: .principal) {
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button (action: {}) {
                        Image(systemName: "list.bullet")
                    }
                }
            }
            .tint(.init(UIColor.lightGray))
        }
        .onAppear {
            let appearence = UINavigationBarAppearance()
            appearence.configureWithOpaqueBackground()
            appearence.backgroundColor = UIColor.systemBackground
            UINavigationBar.appearance().standardAppearance = appearence
            UINavigationBar.appearance().scrollEdgeAppearance = appearence
        }
       
//        .
    }
}

struct MainHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MainHomeView().preferredColorScheme(.dark)
    }
}
