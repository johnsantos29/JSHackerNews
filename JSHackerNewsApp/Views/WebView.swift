//
//  WebView.swift
//  JSHackerNewsApp
//
//  Created by John Erick Santos on 9/4/2023.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let urlString: String?

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeUrl = urlString, let url = URL(string: safeUrl) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(urlString: "https://google.com")
    }
}
