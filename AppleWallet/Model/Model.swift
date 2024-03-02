//
//  Model.swift
//  AppleWallet
//
//  Created by Irtaza Fiaz on 02/03/2024.
//

import Foundation

enum ProductType {
    case instantTransfer
    case cashReceived
}

struct Product {
    let id = UUID().uuidString
    let transactionId: String
    let imageName: String
    let title: String
    let description: String
    let date: String
    let price: String
    let type: ProductType
}

let products = [
    Product(transactionId: "456dn32jniu23", imageName: "product1", title: "+1 (623) 633-6278", description: "Canceled - Received", date: "20 Hours ago", price: "$19.99", type: .cashReceived),
    Product(transactionId: "45356fgfsdg4356", imageName: "product2", title: "Copper Debit Card", description: "Instant Transfer", date: "Submitted 2/6/24", price: "$29.99", type: .instantTransfer),
    Product(transactionId: "sdfgfdg6546456", imageName: "product3", title: "+1 (209) 219-6208", description: "Received", date: "2/6/24", price: "$39.99", type: .cashReceived)
]
