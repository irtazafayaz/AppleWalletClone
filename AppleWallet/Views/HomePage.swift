//
//  HomePage.swift
//  AppleWallet
//
//  Created by Irtaza Fiaz on 02/03/2024.
//

import SwiftUI

struct HomePage: View {
    
    @State private var openCardDetailsPage: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                CardViewWrapper()
                    .frame(width: 350, height: 200)
                    .padding()
                    .padding(.top, 5)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Balance")
                            .foregroundStyle(.white)
                        Text("$0.00")
                            .font(.title2)
                            .bold()
                            .foregroundStyle(.white)
                    }
                    Spacer()
                    Text("Send or Request")
                        .foregroundStyle(.black)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(.white)
                        .clipShape(Capsule())
                }
                .padding()
                .background(.gray.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                
                HStack {
                    Text("Latest Transactions")
                        .font(.title)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                    Spacer()
                    
                    Image(systemName: "line.3.horizontal.decrease.circle")
                        .foregroundStyle(.white)
                        .font(.title2)
                }
                .padding(.top, 5)
                
                
                VStack() {
                    ForEach(products, id: \.id) { product in
                        ProductRowView(product: product)
                    }
                }
                .background(.gray.opacity(0.2))
                .cornerRadius(10)
                
                
                
                Spacer()
                
            }
            .background(.black)
            .navigationDestination(isPresented: $openCardDetailsPage, destination: {
                CardDetailsPage()
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.white)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Button(action: {}) {
                            Label("Add Money", systemImage: "square.and.pencil")
                        }
                        Button(action: {}) {
                            Label("Transfer to Bank", systemImage: "trash")
                        }
                        Button(action: {}) {
                            Label("Recurring Payments", systemImage: "trash")
                        }
                        Button(action: {}) {
                            Label("Card Number", systemImage: "trash")
                        }
                        Button(action: {
                            openCardDetailsPage.toggle()
                        }) {
                            Label("Card Details", systemImage: "trash")
                        }
                        Button(action: {}) {
                            Label("Notifications", systemImage: "trash")
                        }
                    } label: {
                        Image(systemName: "ellipsis.circle")
                            .foregroundStyle(.white)
                    }
                }
            }
        }

    }
}

#Preview {
    HomePage()
}


struct ProductRowView: View {
    var product: Product
    
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .foregroundColor(.gray)
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text(product.title)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(product.description)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                Text(product.date)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
            Spacer()
            Text(product.price)
                .foregroundStyle(.white)

            Button(action: {
                
            }) {
                Image(systemName: "chevron.right")
                    .foregroundStyle(.gray)
            }
            .buttonStyle(BorderlessButtonStyle())
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
    }
}
