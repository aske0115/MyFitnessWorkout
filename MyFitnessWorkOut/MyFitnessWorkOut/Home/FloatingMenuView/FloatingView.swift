//
//  FloatingView.swift
//  MyFitnessWorkOut
//
//  Created by 1101249 on 10/14/22.
//

import SwiftUI

struct FloatingView: View {
    var body: some View {
        GeometryReader { g in
            ZStack {
                HStack {
                    Spacer()
                    Button(action: {}) {
                        HStack {
                            Image(systemName: "bolt.fill")
                                .foregroundColor(.white)
                            Text("자유운동")
                                .foregroundColor(.white)
                        }.frame(maxWidth: .infinity , minHeight: 55)
                    }
                    .background(.red)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    Spacer().frame(width: 20)
                    Button(action: {}) {
                        HStack {
                            Image(systemName: "plus")
                                .foregroundColor(.red)
                            Text("루틴추가")
                                .foregroundColor(.red)
                        }.frame(maxWidth: .infinity , minHeight: 55)
                    }
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    Spacer()
                }
                .padding([.leading, .trailing], 15)
                Button(action: {}, label: {
                    Image(systemName: "flame")
                        .foregroundColor(.gray)
                })
                
                .frame(width: 50, height: 50)
                .background(Color(uiColor: .darkGray))
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.clear,lineWidth:2).shadow(radius: 10))
                .padding(.top, -30)
            }
        }
    }
}


struct FloatingView_Previews: PreviewProvider {
    static var previews: some View {
        FloatingView().preferredColorScheme(.dark)
    }
}
