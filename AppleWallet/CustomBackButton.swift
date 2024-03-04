//
//  CustomBackButton.swift
//  AppleWallet
//
//  Created by Irtaza Fiaz on 04/03/2024.
//

import Foundation
import SwiftUI

struct CustomBackButton: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image("ic_back_arrow")
                .foregroundColor(.white)
        }
    }
}
