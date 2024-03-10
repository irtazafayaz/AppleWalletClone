//
//  ContentView.swift
//  AppleWallet
//
//  Created by Irtaza Fiaz on 01/03/2024.
//
import SwiftUI
import CoreMotion

struct ContentView: View {
    
    @State private var focalPoint = CGPoint(x: 0, y: 0)
    
    var body: some View {
        VStack {
            HomePage()
        }
        .padding()
        .background(Color("app-background"))
    }
}

 
#Preview {
    ContentView()
}
