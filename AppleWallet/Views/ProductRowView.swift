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
                if let imageData = product.image, let uiImage = UIImage(data: imageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .frame(width: 50, height: 50)
                        .foregroundColor(.gray)
                } else {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .foregroundColor(.gray)
                        .frame(width: 50, height: 50)
                }

                VStack(alignment: .leading) {
                    HStack {
                        Text(product.title ?? "NaN")
                            .font(.headline)
                            .foregroundColor(Color("black-white"))
                        Spacer()
                        if let type = product.type, type == ProductType.cancel.rawValue {
                            Text(product.price ?? "NaN")
                                .foregroundStyle(.gray)
                                .strikethrough()
                        } else {
                            Text(product.price ?? "NaN")
                                .foregroundStyle(Color("black-white"))
                        }
                        
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.gray)
                            .padding(.leading, 5)
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


