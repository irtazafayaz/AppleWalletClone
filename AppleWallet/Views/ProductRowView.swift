//
//  ProductRowView.swift
//  AppleWallet
//
//  Created by Irtaza Fiaz on 07/03/2024.
//

import SwiftUI

struct ProductRowView: View {
    
    var product: Product
    
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .foregroundColor(.gray)
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text(product.title)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(product.description)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                Text(product.date)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
            Spacer()
            Text(product.price)
                .foregroundStyle(.white)
            
            Button(action: {
                
            }) {
                Image(systemName: "chevron.right")
                    .foregroundStyle(.gray)
            }
            .buttonStyle(BorderlessButtonStyle())
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
    }
}

