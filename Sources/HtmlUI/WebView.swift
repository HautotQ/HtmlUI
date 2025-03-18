import SwiftUI
import WebKit

/// WebView pour afficher le fichier HTML
public struct WebView: UIViewRepresentable {
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    public func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.configuration.preferences.setValue(true, forKey: "allowFileAccessFromFileURLs")
        return webView
    }
    
    public func updateUIView(_ webView: WKWebView, context: Context) {
        webView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
    }
}
