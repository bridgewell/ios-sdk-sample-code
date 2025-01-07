//
//  MobileStickyAdView.swift
//  BridgewellDemoSwiftUI
//
//

import SwiftUI

struct MobileStickyAdView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                Spacer()
                BwsBottomBannerSwiftUIView()
                    .frame(maxWidth: .infinity, maxHeight: 50)
            }.padding(.bottom, 69)
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
    MobileStickyAdView()
}
