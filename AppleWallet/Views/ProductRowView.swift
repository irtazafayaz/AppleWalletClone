//
//  ProductRowView.swift
//  AppleWallet
//
//  Created by Irtaza Fiaz on 07/03/2024.
//

import SwiftUI

struct ProductRowView: View {
    
    var product: Transactions
    
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .foregroundColor(.gray)
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text(product.title ?? "NaN")
                    .font(.headline)
                    .foregroundColor(.white)
                Text(product.desc ?? "NaN")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                Text(product.date ?? "NaN")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
            Spacer()
            Text(product.price ?? "NaN")
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

