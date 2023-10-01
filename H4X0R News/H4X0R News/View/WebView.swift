//
//  WebView.swift
//  H4X0R News
//
//  Created by 李茜 on 10/1/23.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    
    typealias UIViewType = WKWebView
    
    
    let urlStr: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: urlStr) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
}

