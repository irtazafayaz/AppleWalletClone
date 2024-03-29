//
//  TransactionPopupView.swift
//  AppleWallet
//
//  Created by Irtaza Fiaz on 19/03/2024.
//

import SwiftUI

struct TransactionPopupView: View {
    
    @Binding var isPresented: Bool
    @Environment(\.managedObjectContext) var moc
    
    @State private var selectedType: ProductType = .received
    @State private var title: String = ""
    @State private var balance: String = "$"
    @State private var transactionDate = Date()
    
    @State private var image: UIImage?
    @State private var showImagePicker = false
    
    var body: some View {
        NavigationView {
            Form {
                
                Section(header: Text("Transaction Details")) {
                    
                    VStack {
                        if let selectedImage = image {
                            Image(uiImage: selectedImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 100, alignment: .center)
                                .clipShape(Circle())
                                .onTapGesture {
                                    showImagePicker = true
                                }
                        } else {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .foregroundColor(.gray)
                                .frame(width: 100, height: 100, alignment: .center)
                                .onTapGesture {
                                    showImagePicker = true
                                }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
                    
                    TextField("Title", text: $title)
                    
                    Picker("Type", selection: $selectedType) {
                        ForEach(ProductType.allCases, id: \.self) { type in
                            Text(type.rawValue).tag(type)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    TextField("Balance", text: $balance)
                        .keyboardType(.decimalPad)
                    
                    DatePicker("Date", selection: $transactionDate, displayedComponents: [.date, .hourAndMinute])
                }
                
                Button("Add Transaction") {
                    // Add logic to create and save a new transaction
                    addTransaction()
                }
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(image: $image, isShown: $showImagePicker) {
                    // Completion handler to be executed after image selection
                }
            }
            .navigationTitle("Add Transaction")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        isPresented = false
                    }
                }
            }
        }
    }
    
    private func addTransaction() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "M/d/yy, h:mm a"
        let formattedDate = dateFormatter.string(from: transactionDate)
        
        let transaction = Transactions(context: moc)
        transaction.id = UUID().uuidString
        transaction.title = title
        transaction.desc = selectedType.rawValue
        transaction.price = balance
        transaction.date = formattedDate
        transaction.type = selectedType.rawValue
        
        if let selectedImage = image {
            if let imageData = selectedImage.jpegData(compressionQuality: 1.0) {
                transaction.image = imageData
            }
        }
        
        try? moc.save()
        isPresented = false
    }
}


#Preview {
    TransactionPopupView(isPresented: .constant(false))
}
