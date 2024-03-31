//
//  CardNotificationView.swift
//  SwiftUIAlertStyles
//
//  Created by Abdul Karim Khan on 31/03/2024.
//

import SwiftUI

struct CardNotificationView: View {
    
    @State var isTransitionFromTop: Bool
    
    var body: some View {
        ZStack {
            VStack (spacing: 24) {
                if isTransitionFromTop {
                    VStack {
                        
                    }
                    .frame(height: 30)
                }
                HStack {
                    HStack {
                        Image("ic-wallet")
                            .resizable()
                            .frame(width: 28, height: 28)
                        Text("Wallet")
                            .font(.system(size: 18))
                            .foregroundStyle(.white)
                            .bold()
                    }
                    Spacer()
                    HStack (spacing: 16){
                        HStack {
                            Image("ic-coin")
                                .resizable()
                                .frame(width: 16, height: 16)
                            Text("Coin")
                                .font(.system(size: 18))
                                .foregroundStyle(.white)
                                .bold()
                        }
                        HStack {
                            Image("ic-graph")
                                .resizable()
                                .frame(width: 16, height: 16)
                                .opacity(0.7)
                            Text("Graph")
                                .font(.system(size: 18))
                                .foregroundStyle(.gray)
                                .bold()
                        }
                    }
                }
                
                VStack (alignment: .leading, spacing: 0) {
                    Text("Ethereum")
                        .font(.system(size: 18))
                        .foregroundStyle(.gray)
                        .bold()
                    HStack {
                        HStack {
                            Text("$2,312.64")
                                .font(.system(size: 36))
                                .foregroundStyle(.white)
                                .bold()
                            Image("ic-eth")
                                .resizable()
                                .frame(width: 30, height: 30)
                            Spacer()
                            ZStack {
                                HStack (spacing: 4) {
                                    Image("ic-up")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                    Text("20.8%")
                                        .font(.system(size: 16))
                                        .foregroundStyle(.white)
                                        .bold()
                                }
                                .padding(8)
                            }
                            .background(Color(red: 74/255, green: 157/255, blue: 132/255))
                            .clipShape(RoundedRectangle(cornerRadius: 20.0))
                        }
                    }
                }
                
                HStack {
                    ZStack {
                        Button {
                            print("Send")
                        } label: {
                            HStack (spacing: 12) {
                                Text("Send")
                                    .font(.system(size: 18))
                                    .foregroundStyle(.white)
                                    .bold()
                                Image("ic-send")
                                    .resizable()
                                    .frame(width: 22, height: 20)
                            }
                            .padding(14)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .background(.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    .shadow(radius: 10)
                    ZStack {
                        Button {
                            print("Receive")
                        } label: {
                            HStack (spacing: 12) {
                                Text("Receive")
                                    .font(.system(size: 18))
                                    .foregroundStyle(.white)
                                    .bold()
                                Image("ic-receive")
                                    .resizable()
                                    .frame(width: 22, height: 22)
                            }
                            .padding(14)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .background(.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    .shadow(radius: 10)
                }
            }
            .padding(20.0)
        }
        .background(.black)
        .clipShape(RoundedRectangle(cornerRadius: 20.0))
    }
}

