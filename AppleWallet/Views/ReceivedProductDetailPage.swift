//
//  ReceivedProductDetailPage.swift
//  AppleWallet
//
//  Created by Irtaza Fiaz on 03/03/2024.
//

import SwiftUI

struct ReceivedProductDetailPage: View {
    
    var product: Product
    
    var body: some View {
        VStack {
            Text(product.price)
                .foregroundStyle(.white)
                .bold()
                .font(.system(size: 60))

            HStack {
                Text("From ")
                    .foregroundStyle(.gray)
                    .font(.title3)
                Text(product.title)
                    .foregroundStyle(.gray)
                    .font(.title3)
            }
            
            HStack {
                Text(product.date)
                    .foregroundStyle(.gray)
                    .font(.title3)
                Text("5:52 PM")
                    .foregroundStyle(.gray)
                    .font(.title3)
            }
            
            VStack(alignment: .leading) {
                Text("Status: Completed")
                    .foregroundStyle(.white)
                    .font(.title3)
                    .bold()
                Text("Sent from \(product.title)")
                    .foregroundStyle(.gray)
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
                    .padding(.horizontal)
                HStack {
                    Text("Received")
                        .foregroundStyle(.white)
                        .font(.title3)
                        .bold()
                    Spacer()
                    Text(product.price)
                        .foregroundStyle(.white)
                        .font(.title3)
                        .bold()
                }
            }
            .padding()
            .background(Color.gray.opacity(0.2))
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
            .background(Color.gray.opacity(0.2))
            .cornerRadius(8)
            .padding(.top, 10)
            
            VStack(alignment: .leading) {
                Text("Transaction ID")
                    .foregroundStyle(.gray)
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(product.id)
                    .foregroundStyle(.white)
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical, 10)
            .padding(.horizontal)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(8)
            .padding(.top, 10)
            
            
            
            Spacer()
        }
        .background(.black)
    }
}

#Preview {
    ReceivedProductDetailPage(product: products[0])
}
