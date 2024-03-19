//
//  LoginView.swift
//  Revisonner
//
//  Created by Fahad Bin Raza on 05/03/2024.
//

import SwiftUI

struct LoginView: View {
    
    @State private var secretKey: String = ""
    @State private var showAlert: Bool = false
    @FocusState private var keyIsFocused: Bool
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var sessionManager: SessionManager
    @ObservedObject private var viewModel = ViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("app-background")
            
            VStack(spacing: 60) {
                Image("card")
                    .resizable()
                    .frame(width: 320, height: 180)
                
                VStack {
                    Text("Sign In")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom, 10)
                    
                    
                    Text("Sign In with your Secret key")
                        .foregroundColor(Color(.secondaryLabel))
                    
                    SecureField("Secret Key", text: $secretKey)
                        .font(.title3)
                        .padding()
                        .frame(width: 320)
                        .background(.gray.opacity(0.3))
                        .shadow(color: Color.black.opacity(0.08), radius: 60, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                        .padding(.vertical)
                        .submitLabel(.next)
                        .focused($keyIsFocused)
                    
                    Button(action: {
                        viewModel.validateKey(secretKey) { success in
                            if success {
                                sessionManager.goToHomePage()
                            } else {
                                showAlert.toggle()
                            }
                        }
                    }) {
                        Text("Sign In")
                            .foregroundColor(colorScheme == .dark ? .black : .white)
                            .padding()
                            .frame(width: 320, height: 60)
                            .background(colorScheme == .dark ? .white : .black)
                            .cornerRadius(15.0)
                            .font(.headline)
                            .disabled(secretKey.isEmpty)
                            .alert(isPresented: $showAlert) {
                                Alert(title: Text("Error"), message: Text(viewModel.errorText), dismissButton: .default(Text("OK")))
                            }
                    }
                    
                    
                }
                .padding()
                
                Spacer()
            }
            .ignoresSafeArea(.keyboard)
            .padding(.top, 30)
        }
        .background(Color("app-background"))
        .toolbarBackground(Color("app-background"))
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    LoginView()
}
