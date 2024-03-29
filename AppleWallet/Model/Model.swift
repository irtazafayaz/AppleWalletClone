//
//  Model.swift
//  AppleWallet
//
//  Created by Irtaza Fiaz on 02/03/2024.
//

import Foundation

enum ProductType: String, CaseIterable {
    case received = "Received"
    case sent = "Sent"
}

struct Product {
    let id = UUID().uuidString
    let title: String
    let description: String
    let date: String
    let price: String
    let type: ProductType
}

let products = [
    Product(title: "+1 (623) 633-6278", description: "Canceled - Received", date: "20 Hours ago", price: "$19.99", type: .received),
    Product(title: "Copper Debit Card", description: "Instant Transfer", date: "Submitted 2/6/24", price: "$29.99", type: .received),
    Product(title: "+1 (209) 219-6208", description: "Received", date: "2/6/24", price: "$39.99", type: .received)
]
