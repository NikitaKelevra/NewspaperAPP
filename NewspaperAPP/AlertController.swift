//
//  AlertController.swift
//  NewspaperAPP
//
//  Created by Сперанский Никита on 20.03.2022.
//

import UIKit

class AlertController {
    static let shared = AlertController()
    private init() {}
    
//    func showAlert(with title: String, and message: String) {
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
//            
//        }
//        alert.addAction(okAction)
//        present(alert, animated: true)
//    }
}
    
    
    
//    func action(task: Task?, completion: @escaping (String) -> Void) {
//        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
//            guard let newValue = self.textFields?.first?.text else { return }
//            guard !newValue.isEmpty else { return }
//            completion(newValue)
//        }
//
//        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
//
//        addAction(saveAction)
//        addAction(cancelAction)
//        addTextField { textField in
//            textField.placeholder = "Task"
//            textField.text = task?.name
//        }
//    }

