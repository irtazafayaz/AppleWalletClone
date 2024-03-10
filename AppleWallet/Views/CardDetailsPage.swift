//
//  CardDetailsPage.swift
//  AppleWallet
//
//  Created by Irtaza Fiaz on 02/03/2024.
//

import SwiftUI

struct CardDetailsPage: View {
    var body: some View {
        ScrollView {
            VStack {
                Image("card")
                    .resizable()
                    .frame(width: 200, height: 120)
                    .overlay(
                        ZStack(alignment: .topTrailing) {
                            Color.clear
                            Text("$40")
                                .font(.title3)
                                .bold()
                                .foregroundColor(.white)
                                .padding(8)
                        }
                    )
                
                // Titles
                Text("Apple Cash")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 10)
                    .foregroundStyle(Color("black-white"))
                
                Text("Payment Card")
                    .font(.title3)
                    .foregroundStyle(.gray)
                
                HStack(spacing: 10) {
                    Button(action: {}) {
                        VStack {
                            Image(systemName: "phone.fill")
                                .font(.system(size: 20))
                            Text("Call")
                        }
                        .padding(8)
                        .frame(maxWidth: .infinity)
                        .background(Color("white-gray"))
                        .cornerRadius(8)
                    }
                    
                    Button(action: {}) {
                        VStack {
                            Image(systemName: "safari.fill")
                                .font(.system(size: 20))
                            Text("Website")
                        }
                        .padding(8)
                        .frame(maxWidth: .infinity)
                        .background(Color("white-gray"))
                        .cornerRadius(8)
                    }
                }
                .padding(.top, 20)
                
                HStack {
                    Text("Balance")
                        .foregroundStyle(Color("black-white"))
                    Spacer()
                    Text("$0.00")
                        .foregroundStyle(.gray)
                }
                .padding()
                .background(Color("white-gray"))
                .cornerRadius(8)
                .padding(.top, 10)
                
                Text("Your balance can be used to send money or make purchases with Apple Pay")
                    .foregroundStyle(.gray)
                    .font(.caption)
                
                
                VStack(alignment: .leading) {
                    Text("Add Money")
                        .foregroundStyle(.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.top, 10)
                    Divider()
                        .padding(.horizontal)
                        .foregroundStyle(Color("black-white"))
                    Text("Transfer to Bank")
                        .foregroundStyle(.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.bottom, 10)
                }
                .background(Color("white-gray"))
                .cornerRadius(8)
                .padding(.top, 10)
                
                Button(action: {}) {
                    Text("Set Up Auto Reload")
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical)
                        .background(Color("white-gray"))
                        .cornerRadius(8)
                }
                .padding(.top, 10)
                
                Text("Your balance can be used to send money or make purchases with Apple Pay")
                    .foregroundStyle(.gray)
                    .font(.caption)

                VStack(alignment: .leading) {
                    Text("Automatically Accept Payments")
                        .foregroundStyle(Color("black-white"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.top, 10)
                    Divider()
                        .padding(.horizontal)
                        .foregroundStyle(Color("black-white"))
                    Text("Manually Accept Payments")
                        .foregroundStyle(Color("black-white"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.bottom, 10)
                }
                .background(Color("white-gray"))
                .cornerRadius(8)
                .padding(.top, 10)
                
                VStack(alignment: .leading) {
                    Text("Bank Account")
                        .foregroundStyle(Color("black-white"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                }
                .background(Color("white-gray"))
                .cornerRadius(8)
                .padding(.top, 10)
                
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Express Transit")
                            .foregroundStyle(Color("black-white"))
                        Spacer()
                        Text("Off")
                            .foregroundStyle(.gray)
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    Divider()
                        .padding(.horizontal)
                    Text("Express Transit Setting")
                        .foregroundStyle(.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.bottom, 10)
                }
                .background(Color("white-gray"))
                .cornerRadius(8)
                .padding(.top, 10)
                
                
                Text("BILLING ADDRESS")
                    .foregroundStyle(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 10)
                    .padding(.horizontal)
                
                VStack(alignment: .leading) {
                    Text("Billing Address")
                        .foregroundStyle(Color("black-white"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                }
                .background(Color("white-gray"))
                .cornerRadius(8)
                .padding(.top, 5)
                
                VStack(alignment: .leading) {
                    Text("Verify Identity")
                        .foregroundStyle(.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                }
                .background(Color("white-gray"))
                .cornerRadius(8)
                .padding(.top, 10)
                
                Text("Get access to all the features of Apple Cash and eligibility to claim FDIC insurance")
                    .foregroundStyle(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 5)
                    .padding(.horizontal)
                    .font(.caption)

                VStack(alignment: .leading) {
                    Text("Request Transaction Statement")
                        .foregroundStyle(.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                }
                .background(Color("white-gray"))
                .cornerRadius(8)
                .padding(.top, 10)
                
                
                VStack(alignment: .leading) {
                    Text("Privacy Policy")
                        .foregroundStyle(.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.top, 10)
                    Divider()
                        .padding(.horizontal)
                        .foregroundStyle(Color("black-white"))
                    Text("Terms and Conditions")
                        .foregroundStyle(.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.bottom, 10)
                }
                .background(Color("white-gray"))
                .cornerRadius(8)
                .padding(.top, 10)
                
                
            }
            .toolbarBackground(Color("app-background"))
        }
        .toolbarBackground(Color("app-background"))
        .background(Color("app-background"))
    }
}

#Preview {
    CardDetailsPage()
}
