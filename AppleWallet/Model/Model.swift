//
//  Model.swift
//  AppleWallet
//
//  Created by Irtaza Fiaz on 02/03/2024.
//

import Foundation

struct Product {
    let id = UUID().uuidString
    var imageName: String
    var title: String
    var description: String
    var date: String
    var price: String
}

let products = [
    Product(imageName: "product1", title: "+1 (623) 633-6278", description: "Canceled - Received", date: "20 Hours ago", price: "$19.99"),
    Product(imageName: "product2", title: "Copper Debit Card", description: "Instant Transfer", date: "Submitted 2/6/24", price: "$29.99"),
    Product(imageName: "product3", title: "+1 (209) 219-6208", description: "Received", date: "2/6/24", price: "$39.99")
]
