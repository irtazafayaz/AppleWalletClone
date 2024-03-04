//
//  CardViewWrapper.swift
//  AppleWallet
//
//  Created by Irtaza Fiaz on 01/03/2024.
//

import SwiftUI

struct CardViewWrapper: UIViewControllerRepresentable {
    typealias UIViewControllerType = ViewController
    
    func makeUIViewController(context: Context) -> ViewController {
        let viewController = ViewController()
        let rootView = UIHostingController(rootView: EmptyView())
        rootView.view.frame = CGRect(x: 0, y: 0, width: 350, height: 200)
        rootView.view.addSubview(viewController.view)
        viewController.beginMotionUpdates()
        return viewController
    }

    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        // Update any properties or perform any necessary actions here
    }
}

