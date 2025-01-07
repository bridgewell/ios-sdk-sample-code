//
//  InAppCenterBannerViewController.swift
//  BridgewellDemo
//
//

import UIKit
import BridgewellSDK

class InAppCenterBannerViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        displayCenterBannerView()
    }
    
    func displayCenterBannerView() {
        // 1. Create a BannerView
        let bridgewellBannerView = BwsPopupAd(configID: "dev-bws-popup-ad", from: self)
        
        // 2. Configure the BannerView
        bridgewellBannerView.delegate = self
        bridgewellBannerView.adFormat = .banner
        bridgewellBannerView.videoParameters.placement = .InBanner
        
        // 3. Load the banner ad
        bridgewellBannerView.loadAd()
    }

}

// MARK: - BannerViewDelegate
extension InAppCenterBannerViewController: BwsAdViewDelegate {
    /**
     A view controller instance to use for presenting modal views
     as a result of user interaction on an ad. Usual implementation may simply return self,
     if it is view controller class. This is required
     **/
    func adViewPresentationController() -> UIViewController? {
        self
    }
    
    /**
     Callback of an error encountered while loading or rendering an ad. (Optional)
     **/
    func adViewFailed(_ adView: BwsAdView, didFailToReceiveAdWith error: Error) {
        
    }
    
    /**
     callback that an ad has been successfully loaded and rendered.
     **/
    func adViewDisplayed(_ adView: BwsAdView) {
        
    }
    
    /**
     callback that the banner view has dismissed the modal on top of
     the current view controller. (Optional)
     **/
    func adViewDidDismissModal(_ adView: BwsAdView) {
        
    }
    
    /**
     callback whenever current app goes in the background due to user click. (Optional)
     **/
    func adViewClicked(_ adView: BwsAdView) {
        
    }
}
