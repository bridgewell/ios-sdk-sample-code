//
//  CenterBannerView.swift
//  BridgewellDemoSwiftUI
//
//

import SwiftUI
import BridgewellSDK

struct BwsCenterBannerSwiftUIView: UIViewRepresentable {
    
    var banner = BwsPopupAd(configID: POPUP_AD_ID, from: (UIApplication.shared.firstKeyWindow?.rootViewController)!)

    func makeUIView(context: Context) -> BwsPopupAd {
        banner.adFormat = .banner
        banner.videoParameters.placement = .InBanner
        banner.delegate = context.coordinator
        banner.loadAd()
        return banner
    }

    func updateUIView(_ uiView: BwsPopupAd, context: Context) {
        print("Updating view")
    }
    
    func makeCoordinator() -> Coordinator {
        let coor = Coordinator(view: banner)
        return coor
    }
    
    class Coordinator: NSObject, BwsAdViewDelegate {
        
        init(view: BwsAdView) {
            super.init()
            view.delegate = self
        }
        
        func adViewPresentationController() -> UIViewController? {
            UIApplication.shared.firstKeyWindow?.rootViewController
        }
        
    }
}

struct BwsBottomBannerSwiftUIView: UIViewRepresentable {
    
    var banner = BwsMobileStickyAd(configID: "dev-bws-mobile-sticky-ad", bottomMargin: 0, from: (UIApplication.shared.firstKeyWindow?.rootViewController)!)

    func makeUIView(context: Context) -> BwsAdView {
        banner.adFormat = .banner
        banner.videoParameters.placement = .InBanner
        banner.delegate = context.coordinator
        banner.loadAd()
        return banner
    }

    func updateUIView(_ uiView: BwsAdView, context: Context) {
        print("Updating view")
    }
    
    func makeCoordinator() -> Coordinator {
        let coor = Coordinator(view: banner)
        return coor
    }
    
    class Coordinator: NSObject, BwsAdViewDelegate {
        
        init(view: BwsAdView) {
            super.init()
            view.delegate = self
        }
        
        func adViewPresentationController() -> UIViewController? {
            UIApplication.shared.firstKeyWindow?.rootViewController
        }
    }
}

fileprivate let adSize = CGSize(width: UIScreen.main.bounds.width - 32, height: (((UIScreen.main.bounds.width - 32)*250)/300).rounded(.down))
struct BwsBannerSwiftUIView: UIViewRepresentable {
    var banner = BwsBannerAd(frame: CGRect(origin: .zero, size: adSize), configID: "dev-bws-banner-ad", adSize: adSize)
    

    func makeUIView(context: Context) -> BwsAdView {
        banner.adFormat = .banner
        banner.videoParameters.placement = .InBanner
        banner.delegate = context.coordinator
        banner.loadAd()
        return banner
    }

    func updateUIView(_ uiView: BwsAdView, context: Context) {
        print("Updating view")
    }
    
    func makeCoordinator() -> Coordinator {
        let coor = Coordinator(view: banner)
        return coor
    }
    
    class Coordinator: NSObject, BwsAdViewDelegate {
        
        init(view: BwsAdView) {
            super.init()
            view.delegate = self
        }
        
        func adViewPresentationController() -> UIViewController? {
            UIApplication.shared.firstKeyWindow?.rootViewController
        }
        
    }
}

struct BwsFloatButtonSwiftUIView: UIViewRepresentable {
    
    var banner = BwsRightSideStickyAd(configID: "dev-bws-right-side-sticky-ad", from: (UIApplication.shared.firstKeyWindow?.rootViewController)!, bottomMargin: 0)

    func makeUIView(context: Context) -> BwsAdView {
        banner.adFormat = .banner
        banner.videoParameters.placement = .InBanner
        banner.delegate = context.coordinator
        banner.loadAd()
        return banner
    }

    func updateUIView(_ uiView: BwsAdView, context: Context) {
        print("Updating view")
    }
    
    func makeCoordinator() -> Coordinator {
        let coor = Coordinator(view: banner)
        return coor
    }
    
    class Coordinator: NSObject, BwsAdViewDelegate {
        
        init(view: BwsAdView) {
            super.init()
            view.delegate = self
        }
        
        func adViewPresentationController() -> UIViewController? {
            UIApplication.shared.firstKeyWindow?.rootViewController
        }
        
    }
}

extension UIApplication {
    var firstKeyWindow: UIWindow? {
        return UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .filter { $0.activationState == .foregroundActive }
            .first?.keyWindow
    }
}
