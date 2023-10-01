//
//  DetailView.swift
//  H4X0R News
//
//  Created by 李茜 on 10/1/23.
//

import SwiftUI

struct DetailView: View {
    
    let url: String
    
    var body: some View {
        WebView(urlStr: url)
    }
}

#Preview {
    DetailView(url: "https://google.com")
}

