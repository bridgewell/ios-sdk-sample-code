//
//  WebViewController.swift
//  BridgewellDemo
//
//

import UIKit
import WebKit
import BridgewellSDK

class WebViewController: UIViewController {
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Initialize a WKWebViewConfiguration object.
        let webViewConfiguration = WKWebViewConfiguration()
        // Let HTML videos with a "playsinline" attribute play inline.
        webViewConfiguration.allowsInlineMediaPlayback = true
        // Let HTML videos with an "autoplay" attribute play automatically.
        webViewConfiguration.mediaTypesRequiringUserActionForPlayback = []
        // Initialize the WKWebView with your WKWebViewConfiguration object.
        #if DEBUG
        webViewConfiguration.preferences.setValue(true, forKey: "developerExtrasEnabled")
        #endif
        webView = WKWebView(frame: view.frame, configuration: webViewConfiguration)
        webView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(webView)
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            webView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        // Register webview to inject extra properties to html global variable
        // All of them are optional, and retrieved from device
        Bridgewell.shared.registerContentWebViewWithAdInfo(webView) {[weak self] in
            // Callback here
            // Handle after success register some properties to webview
            guard let `self` = self else { return }
            self.handleLoadWebview()
        }
        
        setNavbarLogo()
        setBackBarButton()
    }
    
    private func handleLoadWebview() {
        webView.load(URLRequest(url: URL(string: "https://img.scupio.com/html/sdk-webview-test.html")!))
    }

}
