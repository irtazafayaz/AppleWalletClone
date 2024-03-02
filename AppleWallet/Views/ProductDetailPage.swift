//
//  ProductDetailPage.swift
//  AppleWallet
//
//  Created by Irtaza Fiaz on 02/03/2024.
//

import SwiftUI

struct ProductDetailPage: View {
    
    var product: Product
    @State private var openReceivedDetailsPage: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .foregroundColor(.gray)
                    .frame(width: 100, height: 100)
                
                Text(product.title)
                    .foregroundStyle(.white)
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity)
                
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(product.date)
                            .foregroundStyle(.white)
                            .font(.title2)
                            .padding(.horizontal)
                            .padding(.top, 20)
                        Spacer()
                        Text(product.price)
                            .foregroundStyle(.white)
                            .font(.title2)
                            .padding(.trailing, 5)
                            .padding(.top, 20)
                        Image(systemName: "chevron.right")
                            .padding(.trailing, 20)
                            .foregroundStyle(.gray)
                            .padding(.top, 20)
                    }
                    Text(product.description)
                        .foregroundStyle(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.bottom)
                }
                .onTapGesture {
                    openReceivedDetailsPage.toggle()
                }
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.top, 10)
                
                Spacer()
            }
            .background(.black)
            .navigationDestination(isPresented: $openReceivedDetailsPage, destination: {
                ReceivedProductDetailPage(product: product)
            })
        }
    }
}

#Preview {
    ProductDetailPage(product: products[0])
}
