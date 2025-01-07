//
//  BannerAdView.swift
//  BridgewellDemoSwiftUI
//
//

import SwiftUI

struct BannerAdView: View {
    
    let boxColor1 = Color(hex: "DADADA")
    let boxColor2 = Color(hex: "F5F5F5")
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 8) {
                    HStack {
                        Rectangle()
                            .fill(boxColor1)
                            .frame(width: 240, height: 24)
                            .cornerRadius(4)
                        Spacer()
                    }
                    HStack {
                        Rectangle()
                            .fill(boxColor1)
                            .frame(width: 240, height: 24)
                            .cornerRadius(4)
                        Spacer()
                    }
                    Rectangle()
                        .fill(boxColor2)
                        .frame(height: 24)
                        .cornerRadius(4)
                    Rectangle()
                        .fill(boxColor2)
                        .frame(height: 24)
                        .cornerRadius(4)
                    Rectangle()
                        .fill(boxColor2)
                        .frame(height: 24)
                        .cornerRadius(4)
                    Rectangle()
                        .fill(boxColor2)
                        .frame(height: 24)
                        .cornerRadius(4)
                    BwsBannerSwiftUIView()
                        .frame(width: UIScreen.main.bounds.width - 32, height: (((UIScreen.main.bounds.width - 32)*250)/300).rounded(.down))
                        .aspectRatio(1, contentMode: .fit)
                        .cornerRadius(4)
                    HStack {
                        Rectangle()
                            .fill(boxColor1)
                            .frame(width: 240, height: 24)
                            .cornerRadius(4)
                        Spacer()
                    }
                    Rectangle()
                        .fill(boxColor2)
                        .frame(height: 24)
                        .cornerRadius(4)
                    Rectangle()
                        .fill(boxColor2)
                        .frame(height: 24)
                        .cornerRadius(4)
                    Rectangle()
                        .fill(boxColor1)
                        .frame(height: 64)
                        .cornerRadius(4)
                    HStack {
                        Rectangle()
                            .fill(boxColor1)
                            .frame(width: 240, height: 24)
                            .cornerRadius(4)
                        Spacer()
                    }
                    Rectangle()
                        .fill(boxColor2)
                        .frame(height: 24)
                        .cornerRadius(4)
                    Rectangle()
                        .fill(boxColor2)
                        .frame(height: 24)
                        .cornerRadius(4)
                    Rectangle()
                        .fill(boxColor2)
                        .frame(height: 24)
                        .cornerRadius(4)
                }
            }
            .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
            Spacer() // Adds space between content and bottom tab bar
            
            // Bottom Tab Bar
            HStack {
                VStack {
                    Image("Home")
                    Text("Home")
                        .font(.caption)
                }
                Spacer()
                VStack {
                    Image("NotificationsFilled")
                    Text("News")
                        .font(.caption)
                }
                Spacer()
                VStack {
                    Image("SpaceDashboardFilled")
                    Text("Files")
                        .font(.caption)
                }
                Spacer()
                VStack {
                    Image("PersonFilled")
                    Text("User")
                        .font(.caption)
                }
            }
            .frame(height: 49)
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
            .background(Color.white)
            .overlay(Divider(), alignment: .top) // Top border for the tab bar
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .toolbar {
            ToolbarItem(placement: .principal) {
                Image("LOGO")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 28)
            }
        }
    }
}

#Preview {
    BannerAdView()
}
