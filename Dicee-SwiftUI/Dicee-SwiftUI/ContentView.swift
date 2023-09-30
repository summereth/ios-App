//
//  ContentView.swift
//  Dicee-SwiftUI
//
//  Created by 李茜 on 9/30/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var leftDiceNum = 1
    @State var rightDiceNum = 1
    
    var body: some View {
        ZStack {
            Image(uiImage: .background)
                .resizable()
            .ignoresSafeArea()
            VStack {
                Spacer()
                Image(uiImage: .diceeLogo)
                Spacer()
                HStack {
                    DiceeView(n: leftDiceNum)
                    DiceeView(n: rightDiceNum)
                }
                Spacer()
                Button(action: {
                    self.leftDiceNum = Int.random(in: 1...6)
                    self.rightDiceNum = Int.random(in: 1...6)
                }, label: {
                    Text("Roll")
                        .bold()
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                        .padding(.horizontal)
                })
                .background(Color.red)
                Spacer()
            }
        }
    }
}


struct DiceeView: View {
    let n: Int
    
    var body: some View {
        Image("dice\(n)")
            .padding(.horizontal)
    }
}


#Preview {
    ContentView()
}

