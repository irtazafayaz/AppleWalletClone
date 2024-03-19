//
//  ProductDetailPage.swift
//  AppleWallet
//
//  Created by Irtaza Fiaz on 02/03/2024.
//

import SwiftUI

struct ProductDetailPage: View {
    
    var product: Transactions
    @State private var openReceivedDetailsPage: Bool = false
    @State private var openSentDetailsPage: Bool = false
    @State private var image: UIImage?
    @State private var showImagePicker = false
    
    @Environment(\.managedObjectContext) var moc

    var body: some View {
        NavigationStack {
            VStack {
                if let selectedImage = image {
                    Image(uiImage: selectedImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .onTapGesture {
                            showImagePicker = true
                        }
                } else if let imageData = product.image, let uiImage = UIImage(data: imageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .onTapGesture {
                            showImagePicker = true
                        }
                } else {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .foregroundColor(.gray)
                        .frame(width: 100, height: 100)
                        .onTapGesture {
                            showImagePicker = true
                        }
                }
                
                Text(product.title ?? "NaN")
                    .foregroundStyle(Color("black-white"))
                    .font(.system(size: 26))
                    .bold()
                    .frame(maxWidth: .infinity)
                
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(product.date ?? "NaN")
                            .foregroundStyle(Color("black-white"))
                            .font(.system(size: 18))
                            .bold()
                            .padding(.horizontal)
                            .padding(.top, 20)
                        Spacer()
                        if let type = product.type, type == ProductType.cancel.rawValue {
                            Text(product.price ?? "NaN")
                                .foregroundStyle(Color("black-white"))
                                .font(.system(size: 18))
                                .padding(.trailing, 5)
                                .padding(.top, 20)
                                .strikethrough()
                        } else {
                            Text(product.price ?? "NaN")
                                .foregroundStyle(Color("black-white"))
                                .font(.system(size: 18))
                                .padding(.trailing, 5)
                                .padding(.top, 20)
                        }
                        
                        Image(systemName: "chevron.right")
                            .padding(.trailing, 20)
                            .foregroundStyle(.gray)
                            .padding(.top, 20)
                    }
                    Text(product.desc ?? "NaN")
                        .foregroundStyle(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.bottom)
                        .font(.system(size: 16))
                }
                .onTapGesture {
                    if product.type == ProductType.sent.rawValue {
                        openSentDetailsPage.toggle()
                    } else if product.type == ProductType.received.rawValue {
                        openReceivedDetailsPage.toggle()
                    }
                }
                .background(Color("white-gray"))
                .cornerRadius(8)
                .padding(.top, 10)
                
                Spacer()
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(image: $image, isShown: $showImagePicker) {
                    // Completion handler to be executed after image selection
                    updateTransation()
                }
            }
            .background(Color("app-background"))
            .navigationDestination(isPresented: $openReceivedDetailsPage, destination: {
                ReceivedProductDetailPage(product: product)
            })
            .navigationDestination(isPresented: $openReceivedDetailsPage, destination: {
                SentProductDetailPage(product: product)
            })
            .toolbarRole(.editor)
        }
    }
    
    func updateTransation() {
        // Check if an image has been selected
        guard let selectedImage = image else {
            return // If no image is selected, return early
        }
        // Convert the selected image to data
        if let imageData = selectedImage.jpegData(compressionQuality: 1.0) {
            // Assign the image data to the product's image attribute
            product.image = imageData
            
            // Save the changes to Core Data
            do {
                try moc.save()
            } catch {
                print("Error saving context: \(error.localizedDescription)")
            }
        }
    }

}

//#Preview {
//    ProductDetailPage(product: products[0])
//}
