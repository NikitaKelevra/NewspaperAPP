//
//  NewsDetailsViewController.swift
//  NewspaperAPP
//
//  Created by Сперанский Никита on 01.04.2022.
//

import UIKit


// Класс+экран с детальной информацией по выделеной статье
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
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.isHighlighted = true
        label.backgroundColor = .blue
        label.text = viewModel.title
        print(label.text)
        return label
    }()
    
    private lazy var newsImage = UIImageView()
    private lazy var descriptionLabel = UILabel()
    private lazy var itemStack = UIStackView()
    
    // MARK: - override func viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray   /// для того чтобы было понятно что экран загрузился
        setupMainVew(subviews: titleLabel)   /// Добавляем на экран все необходимые View
        setConstraints()    /// Расставляем элементыя на экране
        setupProperties()   /// Передаем данные в поля
    }

    
    // MARK: - Private func
    /// Добавляем на экран все необходимые View
    private func setupMainVew(subviews: UIView...) {
        subviews.forEach { subview in
            view.addSubview(subview)
        }

    }
    
    
    
    /// Расстановка элементов на экране
    private func setConstraints() {

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),            /// верний констрейнт
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),    /// левый констрейнт
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),  /// правый констрейнт
            titleLabel.heightAnchor.constraint(equalToConstant: 60),      /// высота titleLabel
        ])
        
////        itemStack.addSubview(titleLabel)
//        itemStack.addSubview(newsImage)
//        itemStack.addSubview(descriptionLabel)
////        itemStack.axis = .vertical
//
//        itemStack.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            itemStack.topAnchor.constraint(equalTo: view.topAnchor),            /// верний констрейнт
//            itemStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),    /// левый констрейнт
//            itemStack.trailingAnchor.constraint(equalTo: view.trailingAnchor),  /// правый констрейнт
//            itemStack.heightAnchor.constraint(equalTo: view.heightAnchor),      /// высота itemStack
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
