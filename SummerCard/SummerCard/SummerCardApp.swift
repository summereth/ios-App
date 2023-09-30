//
//  SummerCardApp.swift
//  SummerCard
//
//  Created by 李茜 on 9/29/23.
//

import SwiftUI

@main
struct SummerCardApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: SummerCardDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
