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
                    Button(action: {}) {
                        Image(systemName: "folder")
                    }
//                        List {
                            ForEach(0..<50) { row in
                                Button {
                                    print(row)
                                } label: {
                                    Text("row = \(row)")
                                }

//                                Text("FitWork ROW \(row)")
                            }
//                        }
                        
//                        .listStyle(.plain)
                }
            }
           
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button (action: {}) {
                        Image(systemName: "folder")
                    }
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
        }
    }
}

struct MainHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MainHomeView()
    }
}
