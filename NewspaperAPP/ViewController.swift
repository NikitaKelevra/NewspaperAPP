//
//  ViewController.swift
//  NewspaperAPP
//
//  Created by Сперанский Никита on 15.03.2022.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    
    
    @IBAction func showNewsButtonPressed(_ sender: Any) {
        NetworkManager.shared.fetchNews()
    }
    
    
    
    private func showSpinner(in view: UIView) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .green
        activityIndicator.startAnimating()
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        
        view.addSubview(activityIndicator)
        
        return activityIndicator
    }

}

