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
    @State private var showHomeScreen: Bool = false
    @State private var showNavBar: Bool = false
    @State private var hideNavBar: Bool = false
    @State private var openCardDetailsPage: Bool = false
    @EnvironmentObject var sessionManager: SessionManager

    var body: some View {
        VStack {
            switch sessionManager.authState {
            case .home:
                VStack {
                    if !hideNavBar {
                        TopNav(showNavBar: $showNavBar, openCardDetailsPage: $openCardDetailsPage, hideNavBar: $hideNavBar)
                    }
                    HomePage(showNavBar: $showNavBar, openCardDetailsPage: $openCardDetailsPage, hideNavBar: $hideNavBar)
                }
            case .login:
                LoginView()
            }
        }
        .onAppear {
            if UserDefaults.standard.bool(forKey: "is-user-logged-in") == true {
                sessionManager.authState = .home
            }
        }
        .padding()
        .background(Color("app-background"))
    }
}


 
#Preview {
    ContentView()
}
