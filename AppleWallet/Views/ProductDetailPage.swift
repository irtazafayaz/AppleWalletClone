//
//  ProductDetailPage.swift
//  AppleWallet
//
//  Created by Irtaza Fiaz on 02/03/2024.
//

import SwiftUI

struct ProductDetailPage: View {
    var body: some View {
        VStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .foregroundColor(.gray)
                .frame(width: 100, height: 100)
            
            Text("+1 (000) 000-0000")
                .foregroundStyle(.white)
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity)
            
            
            VStack(alignment: .leading) {
                HStack {
                    Text("2/6/24")
                        .foregroundStyle(.white)
                        .font(.title2)
                        .padding(.horizontal)
                        .padding(.top, 20)
                    Spacer()
                    Text("$20")
                        .foregroundStyle(.white)
                        .font(.title2)
                        .padding(.trailing, 5)
                        .padding(.top, 20)
                    Image(systemName: "chevron.right")
                        .padding(.trailing, 20)
                        .foregroundStyle(.gray)
                        .padding(.top, 20)
                }
                Text("Received")
                    .foregroundStyle(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.bottom)
            }
            .background(Color.gray.opacity(0.2))
            .cornerRadius(8)
            .padding(.top, 10)
            
            
            
            Spacer()
            
            
        }
        .padding()
        .background(.black)
    }
}

#Preview {
    ProductDetailPage()
}
