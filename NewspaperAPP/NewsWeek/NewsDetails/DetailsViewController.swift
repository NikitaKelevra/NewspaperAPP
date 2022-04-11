//
//  NewsDetailsViewController.swift
//  NewspaperAPP
//
//  Created by Сперанский Никита on 01.04.2022.
//

import UIKit



class DetailsViewController: UIViewController {
    
    // MARK: - Public properties
    var article: Article!
    var viewModel : DetailsViewModelProtocol!
//    {
//        didSet{
//            self.titleLabel.text = viewModel.title
//            self.descriptionLabel.text = viewModel.description
//
//            guard let imageData = viewModel.imageData else {
//                newsImage.isHidden = true
//                return
//            }
//            newsImage.isHidden = false
//            self.newsImage.image = UIImage(data: imageData)
//        }
//    }
    // MARK: - Private properties
    private let titleLabel = UILabel()
    private let newsImage = UIImageView()
    private let descriptionLabel = UILabel()
    private let itemStack = UIStackView()
    
    // MARK: - override func viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProperties()
        setupElementsView()
    }

    
    // MARK: - Private func
    private func setupElementsView() {
        
        
        itemStack.addSubview(titleLabel)
        itemStack.addSubview(newsImage)
        itemStack.addSubview(descriptionLabel)
        view.addSubview(itemStack)
        
        itemStack.center = view.center
        
//        itemStack.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            itemStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            itemStack.heightAnchor.constraint(equalTo: view.heightAnchor),
//            itemStack.topAnchor.constraint(equalTo: view.topAnchor),
//            itemStack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//        ])
    }
    
    private func setupProperties() {
            self.titleLabel.text = viewModel.title
            self.descriptionLabel.text = viewModel.description
            
            guard let imageData = viewModel.imageData else {
                newsImage.isHidden = true
                return
            }
            newsImage.isHidden = false
            self.newsImage.image = UIImage(data: imageData)
    }
    
    
    
    
//    // MARK: - Navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//    }


 
}
