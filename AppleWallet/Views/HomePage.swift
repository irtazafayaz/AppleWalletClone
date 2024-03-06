//
//  HomePage.swift
//  AppleWallet
//
//  Created by Irtaza Fiaz on 02/03/2024.
//

import SwiftUI

struct HomePage: View {
    
    @State private var openProductDetailsPage: Bool = false
    @State private var openInstantTransferPage: Bool = false
    @State private var selectedProduct: Product = products[0]
    @State private var defaultY: CGFloat = 0
    @State private var showNavBar: Bool = false
    
    @FetchRequest(sortDescriptors: []) var transactions: FetchedResults<Transactions>
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        NavigationStack {
            VStack {
                TopNav(showNavBar: $showNavBar)
                ScrollView {
                    CardViewSection()
                    if showNavBar {
                        BalanceSection()
                        LatestTransactionsSection()
                        ProductsSection(openProductDetailsPage: $openProductDetailsPage, openInstantTransferPage: $openInstantTransferPage)
                    }
                    Spacer()
                }
                .simultaneousGesture(DragGesture().onChanged({
                    let isScrollDown = 0 < $0.translation.height
                    if !isScrollDown {
                        showNavBar = true
                    }
                }))
            }
            .background(.black)
            
            .navigationDestination(isPresented: $openProductDetailsPage, destination: {
                ProductDetailPage(product: selectedProduct)
            })
            .navigationDestination(isPresented: $openInstantTransferPage, destination: {
                InstantTransferPage(product: selectedProduct)
            })
            .toolbarBackground(Color.black)
        }
    }
    
    func generateRandomTransaction() {
        let randomNumber = Int.random(in: 0...2)
        switch(randomNumber) {
        case 0:
            addTransactions(obj:Product(
                title: "+1 (623) 633-6278",
                description: "Received",
                date: "20 Hours ago",
                price: "$19.99",
                type: .received
            ))
        case 1:
            addTransactions(obj: Product(
                title: "Copper Debit Card",
                description: "Instant Transfer",
                date: "Submitted 2/6/24",
                price: "$29.99",
                type: .instant
            ))
        case 2:
            addTransactions(obj: Product(
                title: "+1 (209) 219-6208",
                description: "Canceled",
                date: "2/6/24",
                price: "$39.99",
                type: .cancel
            ))
        default:
            addTransactions(obj:Product(
                title: "+1 (623) 633-6278",
                description: "Received",
                date: "20 Hours ago",
                price: "$19.99",
                type: .received
            ))
        }
    }
    
    func addTransactions(obj: Product) {
        let transaction = Transactions(context: moc)
        transaction.id = obj.id
        transaction.title = obj.title
        transaction.desc = obj.description
        transaction.price = obj.price
        transaction.date = obj.date
        transaction.type = obj.type.rawValue
        try? moc.save()
    }
}

struct CardViewSection: View {
    var body: some View {
        CardViewWrapper()
            .frame(width: 350, height: 200)
            .padding(.top, 5)
    }
}

struct BalanceSection: View {
    var body: some View {
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
    }
}

struct LatestTransactionsSection: View {
    var body: some View {
        HStack {
            Text("Latest Transactions")
                .font(.title)
                .foregroundStyle(.white)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
            Spacer()
            
            Button {
                //                generateRandomTransaction()
            } label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundStyle(.white)
                    .font(.title2)
            }
            
        }
        .padding(.top, 5)
    }
}

struct ProductsSection: View {
    
    @Binding var openProductDetailsPage: Bool
    @Binding var openInstantTransferPage: Bool
    
    var body: some View {
        VStack() {
            ForEach(products, id: \.id) { product in
                Button {
                    if product.type == .received {
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
}






#Preview {
    HomePage()
}


