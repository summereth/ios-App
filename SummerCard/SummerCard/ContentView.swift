//
//  ContentView.swift
//  SummerCard
//
//  Created by 李茜 on 9/29/23.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: SummerCardDocument

    var body: some View {
        ZStack {
            Color(red: 0.5607843137254902, green: 0.7254901960784313, blue: 0.6588235294117647)
                .ignoresSafeArea()
            VStack {
                Image("Avatar")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100, alignment: .top)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 5 )
                    )
                Text("Summer Li")
                    .font(Font.custom("Bradley Hand Bold", size: 40))
                    .bold()
                .foregroundColor(.white)
                Text("iOS Developer")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                Divider()
                InfoView(text: "+1 123-456-7890", imageName: "phone.fill")
                InfoView(text: "summer@gmail.com", imageName: "envelope.fill")
            }
        }
    }
}

#Preview {
    ContentView(document: .constant(SummerCardDocument()))
}

struct InfoView: View {
    
    let text: String
    let imageName: String
    
    var body: some View {
        
        Rectangle()
            .frame(height: 50)
            .foregroundColor(.white)
            .cornerRadius(25)
            .overlay(
                HStack {
                    Image(systemName: imageName)
                        .foregroundColor(.green)
                    Text(text)
                }
            )
            .padding()
    }
}
