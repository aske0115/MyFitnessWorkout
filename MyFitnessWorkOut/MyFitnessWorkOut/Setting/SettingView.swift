//
//  SettingView.swift
//  MyFitnessWorkOut
//
//  Created by 1101249 on 10/16/22.
//

import SwiftUI
import ComposableArchitecture


struct SettingFeature: ReducerProtocol {
    struct State: Equatable {
        var isLogin: Bool = false
    }
    
    enum Action: Equatable {
        case loginState(Bool)
        case accountSetting
        case inAppSetting
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action, Never> {
        switch action {
        case .loginState(let isLogin):
            state.isLogin = isLogin
            return .none
        case .accountSetting:
            return .none
        case .inAppSetting:
            return .none
        }
    }
}

struct SettingView: View {
    let store: StoreOf<SettingFeature>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            NavigationView {
                if #available(iOS 16.0, *) {
                    List {
                        Section(header:
                                    Text("나")
                            .font(.headline)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                        ) {
                            settingListCell("에스케", icon: Image(systemName: "person.fill"), hasChevron: true)
                            settingListCell("FitWork PRO", icon: Image(systemName: "trophy.fill"), hasChevron: false)
                        }.listRowBackground(Color.clear)
                        Section(header:
                                    Text("앱")
                            .foregroundColor(.white)
                            .font(.headline)
                            .fontWeight(.heavy)
                        ) {
                            settingListCell("앱 설정", icon: Image(systemName: "gearshape.2.fill"), hasChevron: true)
                        }.listRowBackground(Color.clear)
                        Section(header:
                                    Text("기타")
                            .foregroundColor(.white)
                            .font(.headline)
                            .fontWeight(.heavy)
                        ) {
                            settingListCell("자주 물어보는 질문", icon: Image(systemName: "checkmark.circle.badge.questionmark"), hasChevron: true)
                            settingListCell("건의사항 쪽지 보내기", icon: Image(systemName: "message.circle"), hasChevron: true)
                            settingListCell("건의사항 메일 보내기", icon: Image(systemName: "envelope.badge"), hasChevron: true)
                            settingListCell("간단하게 리뷰 남기기", icon: Image(systemName: "square.and.pencil.circle"), hasChevron: true)
                            settingListCell("개인정보처리방침", icon: Image(systemName: "doc.richtext"), hasChevron: true)
                            settingListCell("서비스 이용약관", icon: Image(systemName: "doc.text"), hasChevron: true)
                            settingListCell("버전정보", icon: Image(systemName: "v.circle"), hasChevron: true)
                            settingListCell("로그아웃", icon: Image(systemName: "poweroff"), hasChevron: true)
                        }.listRowBackground(Color.clear)
                    }
                    
                    .background(.black)
                    .listStyle(.insetGrouped)
                    .scrollContentBackground(.hidden)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("설정")
                                .foregroundColor(.white)
                        }
                    }
                    .tint(.init(UIColor.white))
                    .background(.black)
                } else {
                    List {
                        Section(header:
                                    Text("나")
                            .font(.headline)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                        ) {
                            settingListCell("에스케", icon: Image(systemName: "person.fill"), hasChevron: true)
                            settingListCell("FitWork PRO", icon: Image(systemName: "trophy.fill"), hasChevron: false)
                        }.listRowBackground(Color.clear)
                        Section(header:
                                    Text("앱")
                            .foregroundColor(.white)
                            .font(.headline)
                            .fontWeight(.heavy)
                        ) {
                            settingListCell("앱 설정", icon: Image(systemName: "gearshape.2.fill"), hasChevron: true)
                        }.listRowBackground(Color.clear)
                        Section(header:
                                    Text("기타")
                            .foregroundColor(.white)
                            .font(.headline)
                            .fontWeight(.heavy)
                        ) {
                            settingListCell("자주 물어보는 질문", icon: Image(systemName: "checkmark.circle.badge.questionmark"), hasChevron: true)
                            settingListCell("건의사항 쪽지 보내기", icon: Image(systemName: "message.circle"), hasChevron: true)
                            settingListCell("건의사항 메일 보내기", icon: Image(systemName: "envelope.badge"), hasChevron: true)
                            settingListCell("간단하게 리뷰 남기기", icon: Image(systemName: "square.and.pencil.circle"), hasChevron: true)
                            settingListCell("개인정보처리방침", icon: Image(systemName: "doc.richtext"), hasChevron: true)
                            settingListCell("서비스 이용약관", icon: Image(systemName: "doc.text"), hasChevron: true)
                            settingListCell("버전정보", icon: Image(systemName: "v.circle"), hasChevron: true)
                            settingListCell("로그아웃", icon: Image(systemName: "poweroff"), hasChevron: true)
                        }.listRowBackground(Color.clear)
                    }
                    .background(.black)
                    .listStyle(.insetGrouped)
                    
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
}

@ViewBuilder
func settingListCell(_ title: String, icon: Image, hasChevron: Bool) -> some View {
    HStack {
        icon
            .frame(width:20, height:20)
            .foregroundColor(.red)
        Spacer().frame(width:15)
        Text(title)
            .foregroundColor(Color(uiColor: UIColor.lightGray))
        if hasChevron {
            Spacer()
            Image(systemName: "chevron.forward")
                .foregroundColor(Color(uiColor: UIColor.lightGray))
        }
    }
}


struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(store: Store(initialState: SettingFeature.State(), reducer: SettingFeature()))
    }
}
