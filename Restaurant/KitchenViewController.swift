//
//  KitchenViewController.swift
//  Restaurant
//
//  Created by Александр on 15.08.2024.
//

import UIKit

// Кухня
final class KitchenViewController: UIViewController {
    
    weak var delegate: KitchenViewControllerDelegat?

    @IBAction private func completeOrderButtonPressed() {
        delegate?.completeOrder()
        dismiss(animated: true)
    }
    
    
}
