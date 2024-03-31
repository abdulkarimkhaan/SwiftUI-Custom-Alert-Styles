//
//  ContentView.swift
//  SwiftUIAlertStyles
//
//  Created by Abdul Karim Khan on 24/03/2024.
//

import SwiftUI

struct NotificationAlertViews: View {
    
    @State var model: AlertData?
    @State var showAlertPop = false
    @State var showAlertSpiral = false
    @State var showAlertSnap = false
    
    var body: some View {
        ZStack {
            VStack (spacing: 40) {
                HStack {
                    Text("Alert Styles")
                        .bold()
                        .font(.system(size: 50))
                        .padding()
                    Spacer()
                }
                //MARK: Buttons
                VStack (spacing: 20) {
                    ///Wallet details as transition
                    Button {
                        model = AlertData(showAlert: true, edge: .top)
                    } label: {
                        Text("Show Wallet Details Dyn-Island")
                            .foregroundStyle(.white)
                            .bold()
                            .font(.title2)
                    }
                    .padding()
                    .background(.green.opacity(0.8))
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    .shadow(radius: 2)
                    
                    ///Wallet details as popup
                    Button {
                        showAlertPop = true
                    } label: {
                        Text("Show Wallet Details As Pop Up")
                            .foregroundStyle(.white)
                            .bold()
                            .font(.title2)
                    }
                    .padding()
                    .background(.green.opacity(0.8))
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    .shadow(radius: 2)
                    
                    ///Wallet details as popup spiral
                    Button {
                        showAlertSpiral = true
                    } label: {
                        Text("Show Wallet Details Spiral Alert")
                            .foregroundStyle(.white)
                            .bold()
                            .font(.title2)
                    }
                    .padding()
                    .background(.green.opacity(0.8))
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    .shadow(radius: 2)
                    
                    ///Wallet details as popup snap
                    Button {
                        showAlertSnap = true
                    } label: {
                        Text("Show Wallet Details Snap Alert")
                            .foregroundStyle(.white)
                            .bold()
                            .font(.title2)
                    }
                    .padding()
                    .background(.green.opacity(0.8))
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    .shadow(radius: 2)
                }
                Spacer()
                Text("github.com/abdulkarimkhaan")
                    .bold()
                    .font(.title3)
                    .padding()
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .modifier(BannerModifier(model: $model))
            .background(.cyan.opacity(0.2))
            
            //MARK: AlertViews
            VStack {
                Spacer()
                CardNotificationView(isTransitionFromTop: false)
                    .padding()
                    .animation(.spring(.bouncy(duration: 0.5)), value: showAlertPop)
                Spacer()
            }
            .scaleEffect(showAlertPop ? 1 : 0.6)
            .animation(.spring, value: showAlertPop) // Animation for scale
            .background(.black.opacity(0.2))
            .opacity(showAlertPop ? 1 : 0)
            
            VStack {
                Spacer()
                CardNotificationView(isTransitionFromTop: false)
                    .padding()
                    .animation(.spring(.bouncy(duration: 0.5)), value: showAlertPop)
                Spacer()
            }
            .rotation3DEffect(
                .degrees(180.0),axis: (x: 0.0, y: 0.0, z: 0.0)
            )
            .rotationEffect(.degrees(showAlertSpiral ? 0 : 360)) // Apply rotation
            .scaleEffect(showAlertSpiral ? 1 : 0.2)
            .animation(.easeInOut(duration: 1), value: showAlertSpiral) // Animation for rotation
            .background(.black.opacity(0.2))
            .opacity(showAlertSpiral ? 1 : 0)
            
            VStack {
                Spacer()
                CardNotificationView(isTransitionFromTop: false)
                    .padding()
                Spacer()
            }
            .scaleEffect(showAlertSnap ? 1 : 0.2)
            .animation(.snappy, value: showAlertSnap) // Animation for scale
            .background(.black.opacity(0.2))
            .opacity(showAlertSnap ? 1 : 0)
        }
        .onTapGesture {
            showAlertPop = false
            showAlertSpiral = false
            showAlertSnap = false
        }
    }
}


#Preview {
    NotificationAlertViews()
}

struct AlertData {
    var showAlert: Bool
    var edge: Edge
}

struct BannerModifier: ViewModifier {
    @Binding var model: AlertData?
    
    func body(content: Content) -> some View {
        content.overlay(
            VStack {               // << holder container !!
                if model != nil {
                    VStack {
                        if let model = model, model.edge == .bottom {
                            Spacer()
                        }
                        CardNotificationView(isTransitionFromTop: true)
                            .clipShape(RoundedRectangle(cornerRadius: 50.0))
                            .shadow(radius: 10)
                            .padding(5)
                        if let model = model, model.edge == .top {
                            Spacer()
                        }
                    }
                    .transition(AnyTransition.move(edge: model?.edge ?? .top).combined(with: .opacity))
                    .gesture(
                        DragGesture()
                            .onChanged { _ in
                                withAnimation {
                                    model = nil
                                }
                            }
                    )
                }
            }
            .animation(.spring, value: model?.showAlert)
            .ignoresSafeArea()
        )
    }
}
