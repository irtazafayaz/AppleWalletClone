//
//  ViewModel.swift
//  AppleWallet
//
//  Created by Irtaza Fiaz on 07/03/2024.
//

import Foundation
import FirebaseFirestore
import Combine

struct FirebaseKeys: Identifiable, Codable {
    @DocumentID var id: String?
    let isValid: Bool
    let sessionEnabled: Bool
    let key: String
}

class ViewModel: ObservableObject {
    
    @Published var firebaseKey: FirebaseKeys = FirebaseKeys(isValid: false, sessionEnabled: false, key: "")
    @Published var errorText: String = ""
    @Published var moveToHomePage: Bool = false
    
    private let db = Firestore.firestore()
    
    func validateKey(_ key: String, completion: @escaping (Bool) -> Void) {
        let db = Firestore.firestore()
        db.collection("wallet-keys")
            .whereField("key", isEqualTo: key)
            .limit(to: 1)
            .getDocuments { (querySnapshot, err) in
                if let error = err {
                    print("Error getting documents: \(error)")
                    self.errorText = "Invalid Key"
                    completion(false)
                } else if let documents = querySnapshot?.documents, let document = documents.first {
                    
                    let data = document.data()
                    print(data)
                    if let isValid = data["isValid"] as? Int,
                       let sessionEnabled = data["sessionEnabled"] as? Int {
                        if isValid == 1 && sessionEnabled == 0 {
                            UserDefaults.standard.set(true, forKey: "is-user-logged-in")
                            let documentID = document.documentID
                            db.collection("wallet-keys").document(documentID).updateData(["sessionEnabled": 1]) { error in
                                if let error = error {
                                    print("Error updating document: \(error)")
                                    completion(false)
                                } else {
                                    print("Document successfully updated")
                                    completion(true)
                                }
                            }
                        } else {
                            self.errorText = "Key Not Valid"
                            completion(false)
                        }
                    } else {
                        self.errorText = "Key Not Valid"
                        completion(false)
                    }
                } else {
                    self.errorText = "Invalid Key"
                    completion(false)
                }
            }
    }

    
    
    
}
