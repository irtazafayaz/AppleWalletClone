//
//  TopNav.swift
//  AppleWallet
//
//  Created by Irtaza Fiaz on 07/03/2024.
//

import SwiftUI

struct TopNav: View {
    
    @Binding var showNavBar: Bool
    @Binding var openCardDetailsPage: Bool
    @Binding var hideNavBar: Bool

    var body: some View {
        VStack {
            if showNavBar {
                HStack {
                    Button(action: {
                        showNavBar = false
                    }) {
                        Text("Done")
                            .foregroundStyle(Color("black-white"))
                            .font(.title3)
                    }
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(Color("black-white"))
                            .font(.title2)
                    }
                    Menu {
                        Button(action: {}) {
                            Label("Add Money", systemImage: "dollarsign.circle")
                        }
                        Button(action: {}) {
                            Label("Transfer to Bank", systemImage: "arrowshape.turn.up.right")
                        }
                        Button(action: {}) {
                            Label("Recurring Payments", systemImage: "clock.arrow.2.circlepath")
                        }
                        Button(action: {}) {
                            Label("Card Number", systemImage: "creditcard.and.123")
                        }
                        Button(action: {
                            hideNavBar = true
                            openCardDetailsPage.toggle()
                        }) {
                            Label("Card Details", systemImage: "info.circle")
                        }
                        Button(action: {}) {
                            Label("Notifications", systemImage: "bell.badge")
                        }
                    } label: {
                        Image(systemName: "ellipsis.circle")
                            .foregroundStyle(Color("black-white"))
                            .font(.title2)
                    }
                }
                
            } else {
                HStack {
                    Button(action: {}) {
                        Text("Wallet")
                            .foregroundStyle(Color("black-white"))
                            .font(.title)
                            .bold()
                    }
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "shippingbox.circle.fill")
                            .foregroundStyle(Color("black-white"))
                            .font(.title2)
                    }
                    Button(action: {}) {
                        Image(systemName: "plus.circle.fill")
                            .foregroundStyle(Color("black-white"))
                            .font(.title2)
                    }
                }
            }
        }
    }
}

//#Preview {
//    TopNav(showNavBar: .constant(false))
//}
