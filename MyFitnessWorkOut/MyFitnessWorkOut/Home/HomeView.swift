//
//  HomeView.swift
//  MyFitnessWorkOut
//
//  Created by 1101249 on 10/2/22.
//

import SwiftUI
import ComposableArchitecture

struct HomeView: View {
    
    var works: [FitWorkItem] = [FitWorkItem(title: "월", subtitle: nil), FitWorkItem(title: "화", subtitle: nil), FitWorkItem(title: "목", subtitle: nil), FitWorkItem(title: "금", subtitle: "한적이 없어유~")]
    
    var body: some View {
        NavigationView {
            GeometryReader { g in
                ZStack {
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
                            HStack {
                                Button(action: {}) {
                                    Image("141")
                                        .resizable()
                                        .clipShape(Circle())
                                        .frame(width: 80, height: 80)
                                        .overlay(Circle().stroke(Color.white,lineWidth:2).shadow(radius: 10))
              
                                }
                                VStack (alignment: .leading) {
                                    Spacer()
                                    HStack {
                                        Text("에스케")
                                            .font(.title)
                                            .foregroundColor(.white)
                                        Image(systemName: "camera")
                                            .foregroundColor(.white)
                                            .frame(width: 30, height: 30, alignment: .center)
                                    }
                                    Text("다음 운동 알람을 설정해주세요")
                                        .font(.footnote)
                                        .foregroundColor(.init(UIColor.lightGray))
                                        .padding(.top, -15)
                                    Spacer()
                                }
                                .padding(.leading, 5)
                            }
                            .padding(.bottom, 10)
                            HStack(alignment:.center) {
                                Button(action: {}) {
                                    VStack {
                                        Image(systemName: "forward.fill").renderingMode(.original)
                                            .foregroundColor(.red)
                                            .padding(.bottom, 5)
                
                                        Text("빠른기록")
                                        
                                    }.frame(maxWidth: .infinity , minHeight: 90)
                                    .background(.secondary)
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                Spacer()
                                Button(action: {}) {
                                    VStack {
                                        Image(systemName: "star.fill").renderingMode(.original).padding(.bottom, 5)
                                        Text("인기루틴")
                                    }.frame(maxWidth: .infinity, minHeight: 90)
                                    .background(.red)
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                            }
                            .padding(.bottom, 5)
                            HStack(alignment:.center) {
                                Text("최근 수행 순")
                                    .foregroundColor(.white)
                                Spacer()
                                Button(action: {}) {
                                    Image(systemName:"line.3.horizontal.decrease.circle")
                                        .foregroundColor(.red)
                                }
                                
                            }.padding([.leading, .trailing, .bottom], 5)
                            ForEach(works, id: \.id) { row in
                                WorkListCell(of: row)
                            }.padding(.bottom, 5)
                            Spacer().frame(height: 60)
                        }
                        .padding([.top, .leading, .trailing], 10)
                    }
                    FloatingView()
                        .padding(.top, g.size.height - 60)
                }
                .frame(width: g.size.width, height: g.size.height, alignment: .topLeading)
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
            .tint(.init(UIColor.white))
            .background(.black)
            
        }
        .onAppear {
            let appearence = UINavigationBarAppearance()
            appearence.configureWithOpaqueBackground()
            appearence.backgroundColor = .black
            
            let toolbarAppearence = UIToolbarAppearance()
            toolbarAppearence.configureWithOpaqueBackground()
            toolbarAppearence.backgroundColor = .black
            
            UIToolbar.appearance().standardAppearance = toolbarAppearence
            UINavigationBar.appearance().standardAppearance = appearence
            UINavigationBar.appearance().scrollEdgeAppearance = appearence
        }
    }
}

@ViewBuilder
func WorkListCell(of: FitWorkItem) -> some View {
    HStack(spacing:15) {
        Spacer()
        Image(systemName: "bolt.fill")
            .foregroundColor(.red)
        VStack(alignment: .leading) {
            Text(of.title)
                .foregroundColor(.white)
            if let subtitle = of.subtitle {
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }.frame(maxWidth: .infinity, minHeight: 80,  alignment: .leading)

        Image(systemName: "ellipsis")
            .foregroundColor(.red)
        Spacer()
    }.frame(maxWidth: .infinity)
        .background(Color("workListColor"))
        .clipShape(RoundedRectangle(cornerRadius: 15))
}

struct MainHomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


struct FitWorkItem {
    let id = UUID()
    let title: String
    let subtitle: String?
}


