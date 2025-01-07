
# Documentation Guide

Bridgewell SDK for iOS.  <br><br>


### SDK Integration

If you are not familiar with using Cocoapods for dependency management, visit their [getting started page](https://guides.cocoapods.org/using/getting-started.html). Once you have your Podfile setup, include the following:

```ruby
target 'YOUR_TARGET' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  # Pods for BridgewellSDK
  pod 'BridgewellSDK'
  
  # Should include this at the end of pod file
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
      end
    end
  end
end
```

Open project folder in commandline and run `pod install` in to add the Bridgewell SDK to project dependencies.

### Initialize SDK
First you have to import SDKs for setting it up, often it is in `AppDelegate` inside didFinishLaunchingWithOptions function:

Swift
```swift
import BridgewellSDK
```

Objective-C
```objectiveC
#import "BridgewellSDK/BridgewellSDK.h"
```

Initialize the Bw SDK, use the following initialization:

Swift
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Initialize Bridgewell SDK
        Bridgewell.initializeSDK({ completeStatus, error in
            ...
        })
        Bridgewell.shared.shareGeocoordinate = true
        Bridgewell.shared.isLocationUpdatesEnabled = true
        Bridgewell.shared.bwsDebug = true
        
        return true
    }
```

Objective-C
```objectiveC
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [Bridgewell initializeSDK:^(PrebidInitializationStatus status, NSError *error) {
        ...
    }];
    
    Bridgewell.shared.shareGeocoordinate = true;
    Bridgewell.shared.isLocationUpdatesEnabled = true;
    Bridgewell.shared.bwsDebug = true;
    return YES;
}
```

### Config SDK

The `Bridgewell` class is a singleton that enables the user to apply global settings.

#### Properties

`shareGeocoordinate`: Optional Bool, if this flag is True AND the app collects the user’s geographical location data, Bridgewell Mobile will send the user’s geographical location data to Bridgewell Server. If this flag is False OR the app does not collect the user’s geographical location data, Bridgewell Mobile will not populate any user geographical location information in the call to Bridgewell Server. The default setting is false.

`isLocationUpdatesEnabled`: Optional Bool.
If true, the SDK will periodically try to listen for location updates in order to request location-based ads.

`bwsDebug`: adds the debug flag (“test”:1) on the outbound http call to Bridgewell Server. The test:1 flag will signal to Bridgewell Server to emit the full resolved request (resolving any Stored Request IDs) as well as the full Bid Request and Bid Response to and from each bidder. Default is `false`

### Examples

Initialize SDK in AppDelegate:

Swift
```swift
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Initialize Bridgewell SDK
        Bridgewell.initializeSDK({ completeStatus, error in
            // User will handle the callback here
        
            if let error = error {
                // Handle when got error
                debugPrint("Initialization Error: \(error.localizedDescription)")
            } else {
                // Handle with different status from backend
                switch completeStatus {
                case.succeeded:
                    debugPrint("Handle when initialize SDK success")
                case .failed:
                    debugPrint("Handle when initialize SDK fail")
                case .serverStatusWarning:
                    debugPrint("Handle when have status warning from checking status")
                default:
                    break
                }
            }
        })
        
        Bridgewell.shared.shareGeocoordinate = true
        Bridgewell.shared.isLocationUpdatesEnabled = true
        Bridgewell.shared.bwsDebug = true
        

        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        requestPermission()
    }
    
    func requestPermission() {
        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization { status in
                switch status {
                case .authorized:
                    // Tracking authorization dialog was shown
                    // and we are authorized
                    debugPrint("Authorized")
                    
                    // Now that we are authorized we can get the IDFA
                    debugPrint(ASIdentifierManager.shared().advertisingIdentifier)
                case .denied:
                    // Tracking authorization dialog was
                    // shown and permission is denied
                    debugPrint("Denied")
                case .notDetermined:
                    // Tracking authorization dialog has not been shown
                    debugPrint("Not Determined")
                case .restricted:
                    debugPrint("Restricted")
                @unknown default:
                    debugPrint("Unknown")
                }
            }
        }
    }
```

Objective-C
```objectiveC
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [Bridgewell initializeSDK:^(PrebidInitializationStatus status, NSError *error) {
        if (error == nil) {
            printf("Initialization Error: \(error.localizedDescription)");
        } else {
            switch (status) {
                case PrebidInitializationStatusSucceeded:
                    printf("Handle when initialize SDK success");
                case PrebidInitializationStatusFailed:
                    printf("Handle when initialize SDK fail");
                case PrebidInitializationStatusServerStatusWarning:
                    printf("Handle when have status warning from checking status");
                default:
                    break;
            }
        }
    }];
    
    Bridgewell.shared.shareGeocoordinate = true;
    Bridgewell.shared.isLocationUpdatesEnabled = true;
    Bridgewell.shared.bwsDebug = true;
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [self requestTrackingPermission];
}

-(void)requestTrackingPermission {
    if (@available(iOS 14, *)) {
        [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
            switch (status) {
                case ATTrackingManagerAuthorizationStatusAuthorized:
                    printf("Tracking authorized");
                case ATTrackingManagerAuthorizationStatusDenied:
                    printf("Tracking denied");
                case ATTrackingManagerAuthorizationStatusNotDetermined:
                    printf("Tracking not determined");
                case ATTrackingManagerAuthorizationStatusRestricted:
                    printf("Tracking not restricted");
                default:
                    printf("Tracking status is unknown");
            }
        }];
    } else {
        // Fallback on earlier versions
    }
}
```

Display banner in your viewcontroller:

Swift
```swift
        var adSize = YOUR_BANNER_SIZE
        // 1. Create a BannerView
        bridgewellBannerView = BwsBannerView(frame: CGRect(origin: .zero, size: adSize), configID: YOUR_CONFIG_ID, adSize: adSize)
        
        // 2. Configure the BannerView
        bridgewellBannerView.delegate = self
        bridgewellBannerView.adFormat = .banner
        bridgewellBannerView.videoParameters.placement = .InBanner
        
        // Add Prebid banner view to the app UI
        bannerView.addSubview(bridgewellBannerView)
        
        // 3. Load the banner ad
        bridgewellBannerView.loadAd()
```

Objective-C
```objectiveC

    CGSize const adSize = YOUR_BANNER_SIZE;
    
    // 1. Create a BannerView
    self.bridgewellBannerView = [[BwsBannerView alloc] initWithFrame:CGRectMake(0, 0, adSize.width, adSize.height) configID:@YOUR_CONFIG_ID adSize:adSize];
    
    // 2. Configure the BannerView
    self.bridgewellBannerView.delegate = self;
    self.bridgewellBannerView.adFormat = AdFormat.banner;
    self.bridgewellBannerView.videoParameters.placement = PBPlacement.InBanner;
    
    // Add Prebid banner view to the app UI
    [self.bannerView addSubview:self.bridgewellBannerView];
    
    // 3. Load the banner ad
    [self.bridgewellBannerView loadAd];
```

Display floating banner in your viewcontroller:

Swift
```swift
        // Create Floating banner view
        let floatingBannerView = BwsBannerView(floatingBannerSize: YOUR_BANNER_SIZE, configId: "YOUR_CONFIG_ID", from: self)
        
        // 2. Configure the BannerView, same as normal banner view
        floatingBannerView.delegate = self
        floatingBannerView.adFormat = .banner
        floatingBannerView.videoParameters.placement = .InBanner
        
        // 3. Load the banner ad and no need for add it to some host view like normal banner because it is fixed to bottom
        floatingBannerView.loadAd()
```

Objective-C
```objectiveC
    // 1. Create Floating banner view
    BwsBannerView *floatingBannerView = [[BwsBannerView alloc] initWithFloatingBannerSize:YOUR_BANNER_SIZE configId:@YOUR_CONFIG_ID eventHandler:nil from:self];
    
    // 2. Configure the BannerView, same as normal banner view
    floatingBannerView.delegate = self;
    floatingBannerView.adFormat = AdFormat.banner;
    floatingBannerView.videoParameters.placement = PBPlacement.InBanner;
    
    // 3. Load the banner ad and no need for add it to some host view like normal banner because it is fixed to bottom
    [floatingBannerView loadAd];
```

Display center banner in your viewcontroller:

Swift
```swift
        // Create Center banner view
        let centerBannerView =  BwsBannerView(from: self, centerSize: YOUR_BANNER_SIZE, configId: YOUR_CONFIG_ID)
        
        // 2. Configure the BannerView, same as normal banner view
        centerBannerView.delegate = self
        centerBannerView.adFormat = .banner
        centerBannerView.videoParameters.placement = .InBanner
        
        // 3. Load the banner ad
        centerBannerView.loadAd()
```

Objective-C
```objectiveC
    // 1. Create Center banner view
    BwsBannerView *centerBannerView = [[BwsBannerView alloc] initFrom:self centerSize:YOUR_BANNER_SIZE configId:@YOUR_CONFIG_ID eventHandler:nil];
    
    // 2. Configure the BannerView, same as normal banner view
    centerBannerView.delegate = self;
    centerBannerView.adFormat = AdFormat.banner;
    centerBannerView.videoParameters.placement = PBPlacement.InBanner;
    
    // 3. Load the banner ad
    [centerBannerView loadAd];
```

MobileSticky Ad View"

Swift
```swift
    // Create MobileSticky banner view
    let centerBannerView = BwsBannerView(from: self, bottomDistance: DISTANCE_FROM_AD_VIEW_TO_SCREEN_BOTTOM, configId: AD_CONFIG_ID) 

    // 2. Configure the BannerView, same as normal banner view
    floatingBannerView.delegate = self
    floatingBannerView.adFormat = .banner
    floatingBannerView.videoParameters.placement = .InBanner

    // 3. Load the banner ad
    floatingBannerView.loadAd()
```

Objective-C
```objectiveC
    // 1. Create MobileSticky banner view
    BwsBannerView *centerBannerView = [[BwsBannerView alloc] initFrom:self bottomDistance:DISTANCE_FROM_AD_VIEW_TO_SCREEN_BOTTOM configId:@AD_CONFIG_ID eventHandler:nil];
    
    // 2. Configure the BannerView, same as normal banner view
    centerBannerView.delegate = self;
    centerBannerView.adFormat = AdFormat.banner;
    centerBannerView.videoParameters.placement = PBPlacement.InBanner;
    
    // 3. Load the banner ad
    [centerBannerView loadAd];
```

For swiftUI you have to do some addition steps:
- Create class AppDelegate and setting your SDK:

Swift
```swift
    class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Initialize Bridgewell SDK
        Bridgewell.initializeSDK({ completeStatus, error in
            // User will handle the callback here
        
            if let error = error {
                // Handle when got error
                debugPrint("Initialization Error: \(error.localizedDescription)")
            } else {
                // Handle with different status from backend
                switch completeStatus {
                case.succeeded:
                    debugPrint("Handle when initialize SDK success")
                case .failed:
                    debugPrint("Handle when initialize SDK fail")
                case .serverStatusWarning:
                    debugPrint("Handle when have status warning from checking status")
                default:
                    break
                }
            }
        })
        
        Bridgewell.shared.shareGeocoordinate = true
        Bridgewell.shared.isLocationUpdatesEnabled = true
        Bridgewell.shared.bwsDebug = true
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        requestPermission()
    }
    
    func requestPermission() {
        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization { status in
                switch status {
                case .authorized:
                    // Tracking authorization dialog was shown
                    // and we are authorized
                    debugPrint("Authorized")
                    
                    // Now that we are authorized we can get the IDFA
                    debugPrint(ASIdentifierManager.shared().advertisingIdentifier)
                case .denied:
                    // Tracking authorization dialog was
                    // shown and permission is denied
                    debugPrint("Denied")
                case .notDetermined:
                    // Tracking authorization dialog has not been shown
                    debugPrint("Not Determined")
                case .restricted:
                    debugPrint("Restricted")
                @unknown default:
                    debugPrint("Unknown")
                }
            }
        }
    }
}
```

- Wrap BwsBannerView by UIViewRepresentable for normal bannerView

Swift
```swift
    var banner = BwsBannerView(frame: CGRect(origin: .zero, size: YOUR_BANNER_SIZE), configID: YOUR_CONFIG_ID, adSize: YOUR_BANNER_SIZE)
    

    func makeUIView(context: Context) -> BwsBannerView {
        banner.adFormat = .banner
        banner.videoParameters.placement = .InBanner
        banner.delegate = context.coordinator
        banner.loadAd()
        return banner
    }

    func updateUIView(_ uiView: BwsBannerView, context: Context) {
        print("Updating view")
    }
    
    func makeCoordinator() -> Coordinator {
        let coor = Coordinator(view: banner)
        return coor
    }
    
    class Coordinator: NSObject, BwsBannerViewDelegate {
        
        init(view: BwsBannerView) {
            super.init()
            view.delegate = self
        }
        
        func bannerViewPresentationController() -> UIViewController? {
            UIApplication.shared.firstKeyWindow?.rootViewController
        }
        
    }
```

- Wrap BwsBannerView by UIViewRepresentable with floatingBannerSize for floating banner

Swift
```swift
    var banner = BwsBannerView(floatingBannerSize: YOUR_BANNER_SIZE, configId: YOUR_CONFIG_ID, from: (UIApplication.shared.firstKeyWindow?.rootViewController)!)
    

    func makeUIView(context: Context) -> BwsBannerView {
        banner.adFormat = .banner
        banner.videoParameters.placement = .InBanner
        banner.delegate = context.coordinator
        banner.loadAd()
        return banner
    }

    func updateUIView(_ uiView: BwsBannerView, context: Context) {
        print("Updating view")
    }
    
    func makeCoordinator() -> Coordinator {
        let coor = Coordinator(view: banner)
        return coor
    }
    
    class Coordinator: NSObject, BwsBannerViewDelegate {
        
        init(view: BwsBannerView) {
            super.init()
            view.delegate = self
        }
        
        func bannerViewPresentationController() -> UIViewController? {
            UIApplication.shared.firstKeyWindow?.rootViewController
        }
        
    }
```
Then you can use as swiftUI view:
```swift
    var body: some View {
        VStack {
            BwsBannerSwiftUIView()
                .frame(height: 250)
            Spacer()
            Group {
                HStack {
                    Spacer(minLength: 45)
                    BwsFloatButtonSwiftUIView()
                        .frame(height: 300)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
```

- Wrap BwsBannerView by UIViewRepresentable with centerSize for center banner

Swift
```swift
    var banner = BwsBannerView(from: (UIApplication.shared.firstKeyWindow?.rootViewController)!, centerSize: YOUR_BANNER_SIZE, configId: YOUR_CONFIG_ID)
    

    func makeUIView(context: Context) -> BwsBannerView {
        banner.adFormat = .banner
        banner.videoParameters.placement = .InBanner
        banner.delegate = context.coordinator
        banner.loadAd()
        return banner
    }

    func updateUIView(_ uiView: BwsBannerView, context: Context) {
        print("Updating view")
    }
    
    func makeCoordinator() -> Coordinator {
        let coor = Coordinator(view: banner)
        return coor
    }
    
    class Coordinator: NSObject, BwsBannerViewDelegate {
        
        init(view: BwsBannerView) {
            super.init()
            view.delegate = self
        }
        
        func bannerViewPresentationController() -> UIViewController? {
            UIApplication.shared.firstKeyWindow?.rootViewController
        }
        
    }
```
Then you can use as swiftUI view:
```swift
    var body: some View {
        ZStack {
            BwsCenterBannerSwiftUIView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
        }
        .navigationTitle("Center Banner")
    }
```

- Wrap BwsBannerView by UIViewRepresentable with bottomDistance for MobileSticky banner

Swift
```swift
    var banner = BwsBannerView(from: (UIApplication.shared.firstKeyWindow?.rootViewController)!, bottomDistance: DISTANCE_FROM_AD_VIEW_TO_SCREEN_BOTTOM, configId: YOUR_CONFIG_ID)
    

    func makeUIView(context: Context) -> BwsBannerView {
        banner.adFormat = .banner
        banner.videoParameters.placement = .InBanner
        banner.delegate = context.coordinator
        banner.loadAd()
        return banner
    }

    func updateUIView(_ uiView: BwsBannerView, context: Context) {
        print("Updating view")
    }
    
    func makeCoordinator() -> Coordinator {
        let coor = Coordinator(view: banner)
        return coor
    }
    
    class Coordinator: NSObject, BwsBannerViewDelegate {
        
        init(view: BwsBannerView) {
            super.init()
            view.delegate = self
        }
        
        func bannerViewPresentationController() -> UIViewController? {
            UIApplication.shared.firstKeyWindow?.rootViewController
        }
        
    }
```
Then you can use as swiftUI view:
```swift
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                BwsBottomBannerSwiftUIView()
                    .frame(maxWidth: .infinity, maxHeight: 50)
            }
        }
        .navigationTitle("Bottom Banner")
    }
```

# About

Copyright 2024 Bridgewell | All Rights Reserved
