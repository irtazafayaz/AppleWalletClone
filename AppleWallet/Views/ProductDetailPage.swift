//
//  ProductDetailPage.swift
//  AppleWallet
//
//  Created by Irtaza Fiaz on 02/03/2024.
//

import SwiftUI

struct ProductDetailPage: View {
    
    var product: Transactions
    @State private var openReceivedDetailsPage: Bool = false
    @State private var openSentDetailsPage: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .foregroundColor(.gray)
                    .frame(width: 100, height: 100)
                
                Text(product.title ?? "NaN")
                    .foregroundStyle(Color("black-white"))
                    .font(.system(size: 26))
                    .bold()
                    .frame(maxWidth: .infinity)
                
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(product.date ?? "NaN")
                            .foregroundStyle(Color("black-white"))
                            .font(.system(size: 18))
                            .bold()
                            .padding(.horizontal)
                            .padding(.top, 20)
                        Spacer()
                        if let type = product.type, type == ProductType.cancel.rawValue {
                            Text(product.price ?? "NaN")
                                .foregroundStyle(Color("black-white"))
                                .font(.system(size: 18))
                                .padding(.trailing, 5)
                                .padding(.top, 20)
                                .strikethrough()
                        } else {
                            Text(product.price ?? "NaN")
                                .foregroundStyle(Color("black-white"))
                                .font(.system(size: 18))
                                .padding(.trailing, 5)
                                .padding(.top, 20)
                        }
                        
                        Image(systemName: "chevron.right")
                            .padding(.trailing, 20)
                            .foregroundStyle(.gray)
                            .padding(.top, 20)
                    }
                    Text(product.desc ?? "NaN")
                        .foregroundStyle(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.bottom)
                        .font(.system(size: 16))
                }
                .onTapGesture {
                    if product.type == ProductType.sent.rawValue {
                        openSentDetailsPage.toggle()
                    } else if product.type == ProductType.received.rawValue {
                        openReceivedDetailsPage.toggle()
                    }
                }
                .background(Color("white-gray"))
                .cornerRadius(8)
                .padding(.top, 10)
                
                Spacer()
            }
            .background(Color("app-background"))
            .navigationDestination(isPresented: $openReceivedDetailsPage, destination: {
                ReceivedProductDetailPage(product: product)
            })
            .navigationDestination(isPresented: $openReceivedDetailsPage, destination: {
                SentProductDetailPage(product: product)
            })
            .toolbarRole(.editor)
        }
    }
}

//#Preview {
//    ProductDetailPage(product: products[0])
//}
