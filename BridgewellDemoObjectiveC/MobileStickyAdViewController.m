//
//  MobileStickyAdViewController.m
//  BridgewellDemoObjectiveC
//

#import "MobileStickyAdViewController.h"
#import "MainViewController.h"

@interface MobileStickyAdViewController ()

@end

@implementation MobileStickyAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavigationBar];
    [self displayBottomBanner];
}

- (void)displayBottomBanner {
    // 1. Create Center banner view
    BwsMobileStickyAd *bottomBannerView = [[BwsMobileStickyAd alloc] initWithConfigID:@"dev-bws-mobile-sticky-ad" bottomMargin:49 from:self];
    
    // 2. Configure the BannerView, same as normal banner view
    bottomBannerView.delegate = self;
    bottomBannerView.adFormat = AdFormat.banner;
    bottomBannerView.videoParameters.placement = PBPlacement.InBanner;
    
    // 3. Load the banner ad
    [bottomBannerView loadAd];
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
