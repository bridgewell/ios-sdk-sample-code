//
//  PopupAdView.swift
//  BridgewellDemoSwiftUI
//
//

import SwiftUI
import BridgewellSDK

let POPUP_AD_ID = "dev-bws-popup-ad"
struct PopupAdView: View {
    
    var body: some View {
        ZStack {
            BackgroundView()
            if BwsPopupAd.canLoadAdView(POPUP_AD_ID) {
                BwsCenterBannerSwiftUIView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
            }
        }
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
    PopupAdView()
}
