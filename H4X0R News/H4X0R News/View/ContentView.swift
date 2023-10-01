//
//  ContentView.swift
//  H4X0R News
//
//  Created by 李茜 on 9/30/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkingManager = NetworkingManager()
    
    var body: some View {
        NavigationView {
            List(networkingManager.posts, rowContent: { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
                
            })
            .navigationBarTitle("H4X0R NEWS")
        }
        .onAppear(perform: {
            self.networkingManager.fetchData()
        })
    }
}


#Preview {
    ContentView()
}
