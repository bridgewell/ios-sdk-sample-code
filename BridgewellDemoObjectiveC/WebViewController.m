//
//  WebViewController.m
//  BridgewellDemoObjectiveC
//
//

#import "WebViewController.h"
#import "WebKit/WebKit.h"
#import "BridgewellSDK/BridgewellSDK.h"

@interface WebViewController ()
@property (nonatomic) WKWebView *webview;
@property (nonatomic) WKUserContentController *contentController;
@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Let HTML videos with a "playsinline" attribute play inline.
    self.contentController = [[WKUserContentController alloc] init];
    
    WKWebViewConfiguration *webViewConfiguration = [[WKWebViewConfiguration alloc] init];
    // Let HTML videos with a "playsinline" attribute play inline.
    webViewConfiguration.allowsInlineMediaPlayback = true;
    // Let HTML videos with an "autoplay" attribute play automatically.
//    webViewConfiguration.mediaTypesRequiringUserActionForPlayback = [];
    
    self.webview = [[WKWebView alloc] initWithFrame:self.view.frame configuration:webViewConfiguration];
    [self.view addSubview:self.webview];
    
    [[Bridgewell shared] registerContentWebViewWithAdInfo:self.webview completion:^{
        [self handleLoadWebview];
    }];
}

-(void)handleLoadWebview {
    NSURL *url = [[NSURL alloc] initWithString:@"https://img.scupio.com/html/sdk-webview-test.html"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [self.webview loadRequest:request];
}

@end
