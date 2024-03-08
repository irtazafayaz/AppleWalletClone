//
//  ProductRowView.swift
//  AppleWallet
//
//  Created by Irtaza Fiaz on 07/03/2024.
//

import SwiftUI

struct ProductRowView: View {
    
    var product: Transactions
    @State private var offset = CGSize.zero

    var body: some View {
        VStack {
            
            HStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .foregroundColor(.gray)
                    .frame(width: 50, height: 50)
                VStack(alignment: .leading) {
                    Text(product.title ?? "NaN")
                        .font(.headline)
                        .foregroundColor(Color("black-white"))
                    Text(product.desc ?? "NaN")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                    Text(product.date ?? "NaN")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
                Spacer()
                if let type = product.type, type == ProductType.cancel.rawValue {
                    Text(product.price ?? "NaN")
                        .foregroundStyle(Color("black-white"))
                        .strikethrough()
                } else {
                    Text(product.price ?? "NaN")
                        .foregroundStyle(Color("black-white"))
                }
                
                Button(action: {
                    
                }) {
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.gray)
                }
                .buttonStyle(BorderlessButtonStyle())
            }
           

        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    let horizontalTranslation = gesture.translation.width
                    // Check if the card has been moved significantly to the left
                    if offset.width <= 0 || horizontalTranslation < 0 {
                        offset = CGSize(width: horizontalTranslation, height: 0)
                    }
                }
                .onEnded { _ in
                    if abs(offset.width) > 50 {
                        // remove the card
                    } else {
                        offset = .zero
                    }
                }
        )
    }
}

