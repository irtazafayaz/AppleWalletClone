//
//  AppleWalletApp.swift
//  AppleWallet
//
//  Created by Irtaza Fiaz on 01/03/2024.
//

import SwiftUI

@main
struct AppleWalletApp: App {
    
    @StateObject private var dataController = DataController()
    @Environment(\.colorScheme) var colorScheme

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
