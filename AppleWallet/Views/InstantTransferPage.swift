//
//  InstantTransferPage.swift
//  AppleWallet
//
//  Created by Irtaza Fiaz on 03/03/2024.
//

import SwiftUI

struct InstantTransferPage: View {
    
    var product: Product
    
    var body: some View {
        VStack {
            Text(product.price)
                .foregroundStyle(.white)
                .font(.system(size: 60))
                .bold()
            
            HStack {
                Text("Instant Transfer")
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
                Text("Status: Cleared")
                    .foregroundStyle(.white)
                    .font(.title3)
                    .bold()
                Text("Transfered from Apple Cash")
                    .foregroundStyle(.gray)
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
                    .padding(.horizontal)
                HStack {
                    Text("Transferred to Card")
                        .foregroundStyle(.white)
                        .font(.title3)
                    Spacer()
                    Text("$24.62")
                        .foregroundStyle(.white)
                        .font(.title3)
                }
                HStack {
                    Text("Instant Transfer Fee")
                        .foregroundStyle(.white)
                        .font(.title3)
                    Spacer()
                    Text("$0.38")
                        .foregroundStyle(.white)
                        .font(.title3)
                }
                Divider()
                    .padding(.horizontal)
                HStack {
                    Text("Total")
                        .foregroundStyle(.white)
                        .font(.title3)
                        .bold()
                    Spacer()
                    Text("$25.00")
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
                Text("Transaction ID")
                    .foregroundStyle(.gray)
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(product.transactionId)
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
    InstantTransferPage(product: products[0])
}
