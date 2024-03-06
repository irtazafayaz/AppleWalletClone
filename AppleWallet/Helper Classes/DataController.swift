//
//  DataController.swift
//  AppleWallet
//
//  Created by Irtaza Fiaz on 07/03/2024.
//

import Foundation

import Foundation
import CoreData

class DataController: ObservableObject {
    
    let container = NSPersistentContainer(name: "Transactions")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
            
        }
    }
    
}
