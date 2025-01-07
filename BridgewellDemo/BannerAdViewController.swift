//
//  ViewController.swift
//  BridgewellDemo
//
//

import UIKit
import BridgewellSDK

fileprivate let bannerBaseViewControllerNibName = "BannerBaseViewController"
fileprivate let storedImpDisplayBanner = "dev-bws-banner-ad"


class BannerAdViewController: UIViewController {
    
    @IBOutlet weak var bannerView: UIView!
    private var bridgewellBannerView: BwsAdView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: DispatchWorkItem(block: {
            self.createNormalBannerView()
        }))
    }
    
    func createNormalBannerView() {
        let width = bannerView.bounds.size.width.rounded(.down)
        let height = bannerView.bounds.size.height.rounded(.down)
        let size = CGSize(width: width, height: height)
        // 1. Create a BannerView
        bridgewellBannerView = BwsBannerAd(frame: CGRect(origin: .zero, size: size), configID: storedImpDisplayBanner, adSize: size)
        
        // 2. Configure the BannerView
        bridgewellBannerView.delegate = self
        bridgewellBannerView.adFormat = .banner
        bridgewellBannerView.videoParameters.placement = .InBanner
        
        // Add Prebid banner view to the app UI
        bannerView.addSubview(bridgewellBannerView)
        
        // 3. Load the banner ad
        bridgewellBannerView.loadAd()
    }
    
}
// MARK: - BannerViewDelegate
extension BannerAdViewController: BwsAdViewDelegate {
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
