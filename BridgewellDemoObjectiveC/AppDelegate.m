//
//  AppDelegate.m
//  BridgewellDemoObjectiveC
//
//

#import "AppDelegate.h"
#import "BridgewellSDK/BridgewellSDK.h"
#import "AppTrackingTransparency/ATTrackingManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    Bridgewell.shared.bridgewellServerAccountId = @"1554";
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
    Bridgewell.shared.bwPbsDebug = true;
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

#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options  API_AVAILABLE(ios(13.0)){
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions  API_AVAILABLE(ios(13.0)){
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
