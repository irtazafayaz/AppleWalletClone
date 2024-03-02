//
//  CardViewWrapper.swift
//  AppleWallet
//
//  Created by Irtaza Fiaz on 01/03/2024.
//

import SwiftUI

struct CardViewWrapper: UIViewRepresentable {
    func makeUIView(context: Context) -> CardView {
        let card = CardView()
        card.bounds.size = CGSize(width: 350, height: 200)
        card.setupDots()
        return card
    }
    
    func updateUIView(_ uiView: CardView, context: Context) {
        // Update any properties or perform any necessary actions here
    }
}

