//
//  RightStickyAdViewController.swift
//  BridgewellDemo
//
//

import UIKit
import BridgewellSDK

class RightSideStickyAdContainer: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
    }
}

class RightStickyAdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        displayRightStickyAd()
    }
    
    func displayRightStickyAd() {
        // Create Floating banner view
        let floatingBannerView = BwsRightSideStickyAd(configID: "dev-bws-right-side-sticky-ad", from: self, bottomMargin: 0)
        
        // 2. Configure the BannerView, same as normal banner view
        floatingBannerView.delegate = self
        floatingBannerView.adFormat = .banner
        floatingBannerView.videoParameters.placement = .InBanner
        
        // 3. Load the banner ad and no need for add it to some host view like normal banner because it is fixed to bottom
        floatingBannerView.loadAd()
    }

}

// MARK: - BannerViewDelegate
extension RightStickyAdViewController: BwsAdViewDelegate {
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
