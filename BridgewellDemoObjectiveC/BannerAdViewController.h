//
//  BannerAdViewController.h
//  BridgewellDemoObjectiveC
//

#import <UIKit/UIKit.h>
#import <BridgewellSDK/BridgewellSDK.h>


@interface BannerAdViewController : UIViewController <BwsAdViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *bannerView;
@property (strong, nonatomic) BwsAdView *bridgewellBannerView;

@end

