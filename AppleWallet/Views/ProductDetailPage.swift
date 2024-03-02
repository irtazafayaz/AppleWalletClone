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
                .frame(width: 200, height: 120)
            
            // Titles
            Text("Apple Cash")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 10)
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    ProductDetailPage()
}
