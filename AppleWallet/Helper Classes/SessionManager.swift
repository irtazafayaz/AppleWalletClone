//
//  SessionManager.swift
//  AppleWallet
//
//  Created by Irtaza Fiaz on 15/03/2024.
//

import Foundation
import FirebaseFirestore
import Combine

enum AuthState {
    case login
    case home
}

final class SessionManager: ObservableObject {
    
    @Published var authState: AuthState = .login

    private let cancellables: Set<AnyCancellable> = []
    
    func getCurrentAuthUser() {
        
    }
    
    func goToHomePage() {
        DispatchQueue.main.async {
            self.authState = .home
        }
    }
    
    func goToLoginPage() {
        DispatchQueue.main.async {
            self.authState = .login
        }
    }
    
}
