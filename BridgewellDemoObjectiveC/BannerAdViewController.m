//
//  BannerAdViewController.m
//  BridgewellDemoObjectiveC
//
//

#import "MainViewController.h"
#import <UIKit/UIKit.h>
#import <BridgewellSDK/BridgewellSDK.h>

static NSString *const bannerBaseViewControllerNibName = @"BannerBaseViewController";
static NSString *const storedImpDisplayBanner = @"dev-bws-banner-ad";

@interface BannerAdViewController : UIViewController <BwsAdViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *bannerView;
@property (strong, nonatomic) BwsAdView *bridgewellBannerView;

@end

@implementation BannerAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBar];
    
    // Delay to create the normal banner view
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self createNormalBannerView];
    });
}

- (void)createNormalBannerView {
    CGFloat width = floor(self.bannerView.bounds.size.width);
    CGFloat height = floor(self.bannerView.bounds.size.height);
    CGSize size = CGSizeMake(width, height);
    
    // 1. Create a BannerView
    self.bridgewellBannerView = [[BwsBannerAd alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height) configID:storedImpDisplayBanner adSize:size throttleTimeSeconds: 30];
    
    // 2. Configure the BannerView
    self.bridgewellBannerView.delegate = self;
    self.bridgewellBannerView.adFormat = AdFormat.banner;
    self.bridgewellBannerView.videoParameters.placement = PBPlacement.InBanner;
    
    // Add Prebid banner view to the app UI
    [self.bannerView addSubview:self.bridgewellBannerView];
    
    // 3. Load the banner ad
    [self.bridgewellBannerView loadAd];
}

#pragma mark - BwsAdViewDelegate

/**
 A view controller instance to use for presenting modal views
 as a result of user interaction on an ad.
 **/
- (UIViewController *)adViewPresentationController {
    return self;
}

/**
 Callback of an error encountered while loading or rendering an ad.
 **/
- (void)adViewFailed:(BwsAdView *)adView didFailToReceiveAdWithError:(NSError *)error {
    // Handle ad loading error
}

/**
 Callback that an ad has been successfully loaded and rendered.
 **/
- (void)adViewDisplayed:(BwsAdView *)adView {
    // Handle successful ad display
}

/**
 Callback that the banner view has dismissed the modal on top of
 the current view controller.
 **/
- (void)adViewDidDismissModal:(BwsAdView *)adView {
    // Handle modal dismissal
}

/**
 Callback whenever current app goes in the background due to user click.
 **/
- (void)adViewClicked:(BwsAdView *)adView {
    // Handle ad click
}

@end
