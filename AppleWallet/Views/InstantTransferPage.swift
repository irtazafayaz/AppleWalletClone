//
//  InstantTransferPage.swift
//  AppleWallet
//
//  Created by Irtaza Fiaz on 03/03/2024.
//

import SwiftUI

struct InstantTransferPage: View {
    
    var product: Transactions
    
    func getFees() -> String {
        if let price = product.price {
            let priceWithoutDollarSign = price.replacingOccurrences(of: "$", with: "")
            if let priceNum = Double(priceWithoutDollarSign) {
                return String("$\(priceNum - 0.38)")
            } else {
                return "NaN"
            }
        } else {
            return "NaN"
        }
    }

    
    var body: some View {
        VStack {
            Text(product.price ?? "NaN")
                .foregroundStyle(Color("black-white"))
                .font(.system(size: 60))
                .bold()
            
            HStack {
                Text("Instant Transfer")
                    .foregroundStyle(.gray)
                    .font(.system(size: 18))
            }
            
            HStack {
                Text(product.date ?? "NaN")
                    .foregroundStyle(.gray)
                    .font(.system(size: 18))
                Text("5:52 PM")
                    .foregroundStyle(.gray)
                    .font(.system(size: 18))
            }
            
            VStack(alignment: .leading) {
                Text("Status: Cleared")
                    .foregroundStyle(Color("black-white"))
                    .font(.system(size: 18))
                    .bold()
                Text("Transfered from Apple Cash")
                    .foregroundStyle(.gray)
                    .font(.system(size: 18))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
                    .foregroundColor(Color("black-white"))
                    .padding(.vertical,5)
                HStack {
                    Text("Transferred to Card")
                        .foregroundStyle(Color("black-white"))
                        .font(.system(size: 18))
                    Spacer()
                    Text(getFees())
                        .foregroundStyle(Color("black-white"))
                        .font(.system(size: 18))
                }
                HStack {
                    Text("Instant Transfer Fee")
                        .foregroundStyle(Color("black-white"))
                        .font(.system(size: 18))
                    Spacer()
                    Text("$0.38")
                        .foregroundStyle(Color("black-white"))
                        .font(.system(size: 18))
                }
                Divider()
                    .foregroundColor(Color("black-white"))
                    .padding(.vertical,5)
                HStack {
                    Text("Total")
                        .foregroundStyle(Color("black-white"))
                        .font(.system(size: 18))
                        .bold()
                    Spacer()
                    Text(product.price ?? "NaN")
                        .foregroundStyle(Color("black-white"))
                        .font(.system(size: 18))
                        .bold()
                }
            }
            .padding()
            .background(Color("white-gray"))
            .cornerRadius(8)
            .padding(.top, 10)
            
            VStack(alignment: .leading) {
                Text("Transaction ID")
                    .foregroundStyle(.gray)
                    .font(.system(size: 18))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(product.id ?? "NaN")
                    .foregroundStyle(Color("black-white"))
                    .font(.system(size: 18))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical, 10)
            .padding(.horizontal)
            .background(Color("white-gray"))
            .cornerRadius(8)
            .padding(.top, 10)
            
            Spacer()
        }
        .background(Color("app-background"))
        .toolbarRole(.editor)
    }
}

//#Preview {
//    InstantTransferPage(product: products[0])
//}
