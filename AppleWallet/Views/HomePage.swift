//
//  HomePage.swift
//  AppleWallet
//
//  Created by Irtaza Fiaz on 02/03/2024.
//

import SwiftUI

struct HomePage: View {
    
    @State private var openProductDetailsPage: Bool = false
    @State private var openSentDetailsPage: Bool = false
    @State private var openInstantTransferPage: Bool = false
    @State private var selectedProduct: Product = products[0]
    @State private var selectedTransaction: Transactions?
    @State private var defaultY: CGFloat = 0
    @State private var showNavBar: Bool = false
    
    @FetchRequest(sortDescriptors: []) var transactions: FetchedResults<Transactions>
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        NavigationStack {
            VStack {
                TopNav(showNavBar: $showNavBar)
                CardViewSection()
                    .simultaneousGesture(DragGesture().onChanged({
                        let isScrollDown = 0 < $0.translation.height
                        if !isScrollDown {
                            showNavBar = true
                        }
                    }))
                if showNavBar {
                    BalanceSection()
                        .padding(.top, 10)
                    LatestTransactionsSection {
                        generateRandomTransaction()
                    }
                    TransactionDetails(openProductDetailsPage: $openProductDetailsPage, openSentProductDetailsPage: $openSentDetailsPage, openInstantTransferPage: $openInstantTransferPage, selectedTransaction: $selectedTransaction)
                }
                Spacer()
                
            }
            .background(Color("app-background"))
            .navigationBarBackButtonHidden()
            .navigationDestination(isPresented: $openProductDetailsPage, destination: {
                if let selectedTransaction = selectedTransaction {
                    ProductDetailPage(product: selectedTransaction)
                }
            })
            .navigationDestination(isPresented: $openInstantTransferPage, destination: {
                if let selectedTransaction = selectedTransaction {
                    InstantTransferPage(product: selectedTransaction)
                }
            })
            .navigationDestination(isPresented: $openSentDetailsPage, destination: {
                if let selectedTransaction = selectedTransaction {
                    SentProductDetailPage(product: selectedTransaction)
                }
            })
            .toolbarBackground(Color("app-background"))
        }
    }
    
    func generateRandomTransaction() {
        let randomNumber = Int.random(in: 0...3)
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
        case 3:
            addTransactions(obj: Product(
                title: "+1 (209) 219-6208",
                description: "Sent",
                date: "2/6/24",
                price: "$39.99",
                type: .sent
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
                    .foregroundStyle(Color("black-white"))
                Text("$40.00")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(Color("black-white"))
            }
            Spacer()
            Text("Send or Request")
                .foregroundColor(Color("white-black"))
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(Color("black-white"))
                .clipShape(Capsule())
        }
        .padding()
        .background(Color("white-gray"))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct LatestTransactionsSection: View {
    
    var action: () -> Void
    
    var body: some View {
        HStack {
            Text("Latest Transactions")
                .font(.title2)
                .bold()
                .foregroundStyle(Color("black-white"))
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
            Spacer()
            
            Button {
                action()
            } label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundStyle(Color("black-white"))
                    .font(.title2)
            }
            
        }
        .padding(.top, 5)
    }
}

struct TransactionDetails: View {
    
    @FetchRequest(sortDescriptors: []) var transactions: FetchedResults<Transactions>
    @Environment(\.managedObjectContext) var moc
    
    @Binding var openProductDetailsPage: Bool
    @Binding var openSentProductDetailsPage: Bool
    @Binding var openInstantTransferPage: Bool
    @Binding var selectedTransaction: Transactions?
    
    var body: some View {
        List {
            ForEach(transactions, id: \.id) { transaction in
                Button {
                    openDetailPage(transaction)
                } label: {
                    ProductRowView(product: transaction)
                }
                .listRowBackground(Color("white-gray"))
            }
            .onDelete(perform: delete)
        }
        .listRowBackground(Color("white-gray"))
        .listStyle(PlainListStyle())
        .cornerRadius(10)
    }
    
    func delete(at offsets: IndexSet) {
        for index in offsets {
            let language = transactions[index]
            moc.delete(language)
        }
        do {
            try moc.save()
        } catch  {
            print("> Error occured during deleting from core data")
        }
    }
    
    private func openDetailPage(_ transaction: Transactions) {
        selectedTransaction = transaction
        guard let type = transaction.type else { return }
        if type == ProductType.received.rawValue {
            openProductDetailsPage.toggle()
        } else if type == ProductType.instant.rawValue {
            openInstantTransferPage.toggle()
        } else if type == ProductType.instant.rawValue {
            openSentProductDetailsPage.toggle()
        }
    }
    
    
}


#Preview {
    HomePage()
}
