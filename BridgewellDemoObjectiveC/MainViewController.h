//
//  MainViewController.h
//  BridgewellDemoObjectiveC
//
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (NavigationBar)

- (void)setNavigationBar;
- (void)setNavbarLogo;
- (void)setBackBarButton;

@end

@interface MainViewController : UITableViewController

@end

NS_ASSUME_NONNULL_END
