//
//  ViewController.swift
//  Restaurant
//
//  Created by Александр on 15.08.2024.
//

import UIKit

// Официант
protocol KitchenViewControllerDelegat: AnyObject {
    func completeOrder()
}

// Клиент
final class ClientViewController: UIViewController {

    @IBOutlet private var clientStatusLabel: UILabel!
    @IBOutlet private var clientActonButton: UIButton!
    
//    Официант принимает заказ и идет на кухню
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let kitchenVC = segue.destination as! KitchenViewController
        kitchenVC.delegate = self
    }

//    Клиент подзывает официанта
    @IBAction private func clientActionButtonPressed() {
        if clientActonButton.titleLabel?.text == "Подозвать официанта" {
            clientActonButton.setTitle("Сделать заказ", for: .normal)
            
//            Официант уточняет готов ли клиент сделать заказ
        } else if clientActonButton.titleLabel?.text == "Сделать заказ" {
            performSegue(withIdentifier: "openKitchenVC", sender: nil)
        } else if clientActonButton.titleLabel?.text == "Оплатить счет" {
            clientStatusLabel.text = "Хочу есть!"
            clientActonButton.setTitle("Подозвать официанта", for: .normal)
        }
    }
}

// MARK: KitchenViewControllerDelegat
// Сегодня я буду вашим официантом
extension ClientViewController: KitchenViewControllerDelegat {
//    Передача заказа клиенту
    func completeOrder() {
        clientStatusLabel.text = "Спасибо"
        clientActonButton.setTitle("Оплатить счет", for: .normal)
    }
}
