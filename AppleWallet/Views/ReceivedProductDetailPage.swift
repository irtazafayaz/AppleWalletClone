//
//  ReceivedProductDetailPage.swift
//  AppleWallet
//
//  Created by Irtaza Fiaz on 03/03/2024.
//

import SwiftUI

struct ReceivedProductDetailPage: View {
    
    var product: Transactions
    
    var body: some View {
        VStack {
            Text(product.price ?? "NaN")
                .foregroundStyle(Color("black-white"))
                .bold()
                .font(.system(size: 60))

            HStack {
                Text("From ")
                    .foregroundStyle(.gray)
                    .font(.title3)
                Text(product.title ?? "NaN")
                    .foregroundStyle(.gray)
                    .font(.title3)
            }
            
            HStack {
                Text(product.date ?? "NaN")
                    .foregroundStyle(.gray)
                    .font(.title3)
                Text("5:52 PM")
                    .foregroundStyle(.gray)
                    .font(.title3)
            }
            
            VStack(alignment: .leading) {
                Text("Status: Completed")
                    .foregroundStyle(Color("black-white"))
                    .font(.title3)
                    .bold()
                Text("Sent from \(product.title ?? "NaN")")
                    .foregroundStyle(.gray)
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
                    .padding(.horizontal)
                HStack {
                    Text("Received")
                        .foregroundStyle(Color("black-white"))
                        .font(.title3)
                        .bold()
                    Spacer()
                    Text(product.price ?? "NaN")
                        .foregroundStyle(Color("black-white"))
                        .font(.title3)
                        .bold()
                }
            }
            .padding()
            .background(Color("white-gray"))
            .cornerRadius(8)
            .padding(.top, 10)
            
            VStack(alignment: .leading) {
                Text("Request Again")
                    .foregroundStyle(.blue)
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical, 10)
            .padding(.horizontal)
            .background(Color("white-gray"))
            .cornerRadius(8)
            .padding(.top, 10)
            
            VStack(alignment: .leading) {
                Text("Transaction ID")
                    .foregroundStyle(.gray)
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(product.id ?? "NaN")
                    .foregroundStyle(Color("black-white"))
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical, 10)
            .padding(.horizontal)
            .background(Color("white-gray"))
            .cornerRadius(8)
            .padding(.top, 10)
            
            
            
            Spacer()
        }
        .background(Color("white-black"))
    }
}

//#Preview {
//    ReceivedProductDetailPage(product: products[0])
//}
