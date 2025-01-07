//
//  BridgewellDemoSwiftUIApp.swift
//  BridgewellDemoSwiftUI
//
//

import SwiftUI
import BridgewellSDK
import AppTrackingTransparency
import AdSupport

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        Bridgewell.shared.bridgewellServerAccountId = "1554"
        
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
        Bridgewell.shared.bwPbsDebug = true
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

@main
struct BridgewellDemoSwiftUIApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
