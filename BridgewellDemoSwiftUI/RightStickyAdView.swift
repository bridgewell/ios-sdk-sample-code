//
//  RightStickyAdView.swift
//  BridgewellDemoSwiftUI
//
//

import SwiftUI
import BridgewellSDK

struct RightStickyAdView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            BackgroundView()
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    BwsFloatButtonSwiftUIView()
                        .frame(width: BwsRightSideStickyAd.containerSize.width, height: BwsRightSideStickyAd.containerSize.height)
                }
            }
            .padding(.bottom, 61)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
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
    RightStickyAdView()
}
