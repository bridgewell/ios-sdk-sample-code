//
//  MainView.swift
//  BridgewellDemoSwiftUI
//
//

import SwiftUI

struct MainView: View {
    @State private var isPresented = false
    
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    PopupAdView()
                 } label: {
                     Text("PopupAd 1:1")
                         .font(Font.system(size: 14, weight: .semibold))
                 }
                NavigationLink {
                    RightStickyAdView()
                 } label: {
                     Text("RightSideStickyAd 1:1")
                         .font(Font.system(size: 14, weight: .semibold))
                 }
                NavigationLink {
                    MobileStickyAdView()
                 } label: {
                     Text("MobileStickyAd 320:50")
                         .font(Font.system(size: 14, weight: .semibold))
                 }
                NavigationLink {
                    BannerAdView()
                 } label: {
                     Text("BannerAd 300x250")
                         .font(Font.system(size: 14, weight: .semibold))
                 }
            }
            .navigationBarTitleDisplayMode(.inline)
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
}

#Preview {
    MainView()
}
