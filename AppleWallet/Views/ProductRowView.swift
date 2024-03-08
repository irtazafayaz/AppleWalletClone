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
                    HStack {
                        Text(product.title ?? "NaN")
                            .font(.headline)
                            .foregroundColor(Color("black-white"))
                        Spacer()
                        if let type = product.type, type == ProductType.cancel.rawValue {
                            Text(product.price ?? "NaN")
                                .foregroundStyle(Color("black-white"))
                                .strikethrough()
                        } else {
                            Text(product.price ?? "NaN")
                                .foregroundStyle(Color("black-white"))
                        }
                        
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.gray)
                        
                    }
                    
                    Text(product.desc ?? "NaN")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                    Text(product.date ?? "NaN")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
                Spacer()
                
            }
        }
    }
}


