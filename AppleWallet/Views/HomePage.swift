//
//  HomePage.swift
//  AppleWallet
//
//  Created by Irtaza Fiaz on 02/03/2024.
//

import SwiftUI
import Shiny

struct HomePage: View {
    
    @State private var openProductDetailsPage: Bool = false
    @State private var openSentDetailsPage: Bool = false
    @State private var openInstantTransferPage: Bool = false
    @State private var selectedProduct: Product = products[0]
    @State private var selectedTransaction: Transactions?
    @State private var defaultY: CGFloat = 0
    @State private var showNavBar: Bool = false
    @State private var cardBalance: String = (UserDefaults.standard.string(forKey: "cardBalance") ?? "$0")
    @State private var showingTransactionPopup = false

    @FetchRequest(sortDescriptors: []) var transactions: FetchedResults<Transactions>
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        NavigationStack {
            VStack {
                CardViewSection()
                    .simultaneousGesture(DragGesture().onChanged({ value in
                        let isScrollDown = value.translation.height > 0
                        let dragThreshold: CGFloat = 20 // Adjust this threshold value as needed

                        // Only trigger the show/hide logic if the drag distance exceeds the threshold
                        if abs(value.translation.height) > dragThreshold {
                            if !isScrollDown {
                                withAnimation(.linear) {
                                    showNavBar = true
                                }
                            } else {
                                withAnimation(.easeInOut) {
                                    showNavBar = false
                                }
                            }
                        }
                    }))
                if showNavBar {
                    BalanceSection(cardBalance: $cardBalance)
                        .padding(.top, 10)
                    LatestTransactionsSection {
                        showingTransactionPopup.toggle()
                    }
                    TransactionDetails(openProductDetailsPage: $openProductDetailsPage, openSentProductDetailsPage: $openSentDetailsPage, openInstantTransferPage: $openInstantTransferPage, selectedTransaction: $selectedTransaction)
                }
                Spacer()
                
            }
            .onChange(of: cardBalance) {
                UserDefaults.standard.setValue(cardBalance, forKey: "cardBalance")
            }
            .background(Color("app-background"))
            .navigationBarBackButtonHidden()
            .sheet(isPresented: $showingTransactionPopup) {
                TransactionPopupView(isPresented: $showingTransactionPopup)
                    .environment(\.managedObjectContext, self.moc)
            }
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
    
    @State private var cardBalance: String = (UserDefaults.standard.string(forKey: "cardBalance") ?? "$0")
    
    var body: some View {
        
        VStack {
            
            HStack {
                Image(systemName: "applelogo")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.white)
                Text("Pay Cash")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.white)
                Spacer()
                Text(cardBalance)
                    .font(.title3)
                    .bold()
                    .foregroundColor(.white)
            }
            .padding()
            
            Image("card-pattern")
                .resizable()
                .shiny(.iridescent)
        }
        .background(Color("black-gray"))
        .frame(maxWidth: .infinity)
        .frame(height: 250)
        .cornerRadius(10)

    }
}

struct BalanceSection: View {
    @Binding var cardBalance: String
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Balance")
                    .foregroundStyle(Color("black-white"))
                Text(cardBalance)
                    .font(.title)
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
        .scrollIndicators(.hidden)
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
        } else if type == ProductType.sent.rawValue {
            openSentProductDetailsPage.toggle()
        }
    }
}


#Preview {
    HomePage()
}
