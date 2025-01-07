//
//  InAppCenterBannerViewController.m
//  BridgewellDemoObjectiveC
//
//

#import "InAppCenterBannerViewController.h"
#import "MainViewController.h"

@interface InAppCenterBannerViewController ()

@end

@implementation InAppCenterBannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavigationBar];
    [self displayCenterBanner];
}

- (void)displayCenterBanner {
    // 1. Create Center banner view
    BwsPopupAd *centerBannerView = [[BwsPopupAd alloc] initWithConfigID:@"dev-bws-popup-ad" from:self];
    
    // 2. Configure the BannerView, same as normal banner view
    centerBannerView.delegate = self;
    centerBannerView.adFormat = AdFormat.banner;
    centerBannerView.videoParameters.placement = PBPlacement.InBanner;
    
    // 3. Load the banner ad
    [centerBannerView loadAd];
}

/**
 A view controller instance to use for presenting modal views
 as a result of user interaction on an ad. Usual implementation may simply return self,
 if it is view controller class. This is required
 **/
- (UIViewController * _Nullable)adViewPresentationController {
    return self;
}

/**
 Callback of an error encountered while loading or rendering an ad. (Optional)
 **/
- (void)adViewFailed:(BwsAdView *)adView didFailToReceiveAdWith:(NSError *)error {
    
}

/**
 callback that an ad has been successfully loaded and rendered, return ad size of it. (Optional)
 **/
- (void)adViewDisplayed:(BwsAdView *)adView {
    
}

/**
 callback that the banner view has dismissed the modal on top of
 the current view controller. (Optional)
 **/
- (void)adViewDidDismissModal:(BwsAdView *)bannerView {
    
}

/**
 callback that the banner view will launch a modal
 on top of the current view controller, as a result of user interaction. (Optional)
 **/
- (void)adViewWillPresentModal:(BwsAdView *)bannerView {
    
}

/**
 callback whenever current app goes in the background due to user click. (Optional)
 **/
- (void)adViewClicked:(BwsAdView *)adView {
    
}


@end
