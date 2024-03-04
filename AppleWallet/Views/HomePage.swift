//
//  HomePage.swift
//  AppleWallet
//
//  Created by Irtaza Fiaz on 02/03/2024.
//

import SwiftUI

struct HomePage: View {
    
    @State private var openCardDetailsPage: Bool = false
    @State private var openProductDetailsPage: Bool = false
    @State private var openInstantTransferPage: Bool = false
    @State private var selectedProduct: Product = products[0]
    
    @State private var defaultY: CGFloat = 0
    @State private var showNavBar: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                
                if showNavBar {
                    HStack {
                        Button(action: {
                            showNavBar = false
                        }) {
                            Text("Done")
                                .foregroundStyle(.white)
                                .font(.title3)
                        }
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(.white)
                                .font(.title2)
                        }
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
                                .font(.title2)
                        }
                    }
                    
                } else {
                    HStack {
                        Button(action: {}) {
                            Text("Wallet")
                                .foregroundStyle(.white)
                                .font(.title)
                        }
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: "archivebox.circle")
                                .foregroundStyle(.white)
                                .font(.title2)
                        }
                        Button(action: {}) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundStyle(.white)
                                .font(.title2)
                        }
                    }
                }
                ScrollView {
                    
                    CardViewWrapper()
                        .frame(width: 350, height: 200)
                        .padding(.top, 5)
                    
                    if showNavBar {
                        
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
                                Button {
                                    if product.type == .cashReceived {
                                        openProductDetailsPage.toggle()
                                    } else {
                                        openInstantTransferPage.toggle()
                                    }
                                } label: {
                                    ProductRowView(product: product)
                                }
                            }
                        }
                        .background(.gray.opacity(0.2))
                        .cornerRadius(10)
                        
                    }
                    Spacer()
                }
                .simultaneousGesture(
                    DragGesture().onChanged({
                        let isScrollDown = 0 < $0.translation.height
                        if !isScrollDown {
                            showNavBar = true
                        }
                        print(isScrollDown)
                    }))
                
            }
            .background(.black)
            .navigationDestination(isPresented: $openCardDetailsPage, destination: {
                CardDetailsPage()
            })
            .navigationDestination(isPresented: $openProductDetailsPage, destination: {
                ProductDetailPage(product: selectedProduct)
            })
            .navigationDestination(isPresented: $openInstantTransferPage, destination: {
                InstantTransferPage(product: selectedProduct)
            })
            .toolbarBackground(Color.black)
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
