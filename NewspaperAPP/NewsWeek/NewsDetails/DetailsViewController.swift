//
//  NewsDetailsViewController.swift
//  NewspaperAPP
//
//  Created by Сперанский Никита on 01.04.2022.
//

import UIKit



class DetailsViewController: UIViewController {

    var article: Article!
    var viewModel : DetailsViewModelProtocol! {
        didSet{
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }


 
}
