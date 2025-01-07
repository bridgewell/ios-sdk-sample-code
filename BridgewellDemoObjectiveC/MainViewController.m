//
//  MainViewController.m
//  BridgewellDemoObjectiveC
//
//
#import <UIKit/UIKit.h>
#import "MainViewController.h"

@implementation UIViewController (NavigationBar)

- (void)setNavigationBar {
    [self setNavbarLogo];
    [self setBackBarButton];
}

- (void)setNavbarLogo {
    UIImage *logo = [UIImage imageNamed:@"LOGO"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:logo];
    imageView.contentMode = UIViewContentModeScaleAspectFit;

    CGFloat logoWidth = 180.0;
    CGFloat logoHeight = 28.0;
    imageView.frame = CGRectMake(0, 0, logoWidth, logoHeight);

    self.navigationItem.titleView = imageView;
}

- (void)setBackBarButton {
    // Create the custom back button as a UIButton
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [backButton setImage:[UIImage systemImageNamed:@"arrow.left"] forState:UIControlStateNormal];
    backButton.tintColor = [UIColor grayColor];
    [backButton addTarget:self action:@selector(backButtonTapped) forControlEvents:UIControlEventTouchUpInside];

    // Adjust the button size if needed
    backButton.frame = CGRectMake(0, 0, 35.0, 30.0);

    // Wrap the button in a UIBarButtonItem
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = barButtonItem;
}

- (void)backButtonTapped {
    // Handle back button tap
    [self.navigationController popViewControllerAnimated:YES];
}

@end


@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavbarLogo];
}

@end
