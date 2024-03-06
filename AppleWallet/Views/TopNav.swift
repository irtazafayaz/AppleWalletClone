//
//  TopNav.swift
//  AppleWallet
//
//  Created by Irtaza Fiaz on 07/03/2024.
//

import SwiftUI

struct TopNav: View {
    
    @Binding var showNavBar: Bool
    @State private var openCardDetailsPage: Bool = false

    var body: some View {
        VStack {
            if showNavBar {
                HStack {
                    Button(action: {
                        showNavBar = false
                    }) {
                        Text("Done")
                            .foregroundStyle(.white)
                            .font(.title3)
                    }
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.white)
                            .font(.title2)
                    }
                    Menu {
                        Button(action: {}) {
                            Label("Add Money", systemImage: "square.and.pencil")
                        }
                        Button(action: {}) {
                            Label("Transfer to Bank", systemImage: "trash")
                        }
                        Button(action: {}) {
                            Label("Recurring Payments", systemImage: "trash")
                        }
                        Button(action: {}) {
                            Label("Card Number", systemImage: "trash")
                        }
                        Button(action: {
                            openCardDetailsPage.toggle()
                        }) {
                            Label("Card Details", systemImage: "trash")
                        }
                        Button(action: {}) {
                            Label("Notifications", systemImage: "trash")
                        }
                    } label: {
                        Image(systemName: "ellipsis.circle")
                            .foregroundStyle(.white)
                            .font(.title2)
                    }
                }
                
            } else {
                HStack {
                    Button(action: {}) {
                        Text("Wallet")
                            .foregroundStyle(.white)
                            .font(.title)
                    }
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "archivebox.circle")
                            .foregroundStyle(.white)
                            .font(.title2)
                    }
                    Button(action: {}) {
                        Image(systemName: "plus.circle.fill")
                            .foregroundStyle(.white)
                            .font(.title2)
                    }
                }
            }
        }
        .navigationDestination(isPresented: $openCardDetailsPage, destination: {
            CardDetailsPage()
        })

    }
}

#Preview {
    TopNav(showNavBar: .constant(false))
}
