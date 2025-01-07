//
//  WebApiView.swift
//  BridgewellDemoSwiftUI
//
//

import SwiftUI
import WebKit
import BridgewellSDK

struct WebApiView: View {
    var body: some View {
        BwsWebViewDemo()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct BwsWebViewDemo: UIViewRepresentable {
    
    func makeUIView(context: Context) -> WKWebView {
        let webViewConfiguration = WKWebViewConfiguration()
        // Let HTML videos with a "playsinline" attribute play inline.
        webViewConfiguration.allowsInlineMediaPlayback = true
        // Let HTML videos with an "autoplay" attribute play automatically.
        webViewConfiguration.mediaTypesRequiringUserActionForPlayback = []
        // Initialize the WKWebView with your WKWebViewConfiguration object.
        let webView = WKWebView(frame: .zero, configuration: webViewConfiguration)
        webView.translatesAutoresizingMaskIntoConstraints = false
        // Register webview to inject extra properties to html global variable
        // All of them are optional, and retrieved from device
        Bridgewell.shared.registerContentWebViewWithAdInfo(webView) {
            // Callback here
            // Handle after success register some properties to webview
            webView.load(URLRequest(url: URL(string: "https://img.scupio.com/html/sdk-webview-test.html")!))
        }
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        print("Updating view")
    }
}

#Preview {
    WebApiView()
}
