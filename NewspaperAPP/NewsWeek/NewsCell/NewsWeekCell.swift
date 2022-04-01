//
//  NewWeekCell.swift
//  NewspaperAPP
//
//  Created by Сперанский Никита on 26.03.2022.
//

import UIKit

class NewsWeekCell: UICollectionViewCell {
    
    //MARK: - Properties
    static var reuseId: String = "cell"
    private var heightOfItem: CGFloat = 30
    
    private let newsTitle = UILabel()
    private let newsDescription = UILabel()
    private let newsImage = UIImageView()
    private let imageAndDescriptionStack = UIStackView()
    
    //MARK: - viewModel
    
    var viewModel: NewsCellViewModelProtocol! {
        didSet {
            
            self.newsTitle.text = viewModel.title
            self.newsDescription.text = viewModel.description
            
            guard let imageData = viewModel.imageData else {
                newsImage.isHidden = true
                return
            }
            newsImage.isHidden = false
            self.newsImage.image = UIImage(data: imageData)
        }
    }

    //MARK: - Private funcs
    
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setupElements()
        


        return layoutAttributes
    }
    
    
    private func setupElements() {
        newsTitle.translatesAutoresizingMaskIntoConstraints = false
//        newsTitle.backgroundColor = .green
        newsTitle.numberOfLines = 0
        newsTitle.font = .systemFont(ofSize: 15)
        
        
        newsImage.translatesAutoresizingMaskIntoConstraints = false
        newsImage.contentMode = .scaleAspectFit
        newsImage.clipsToBounds = false
             
        
        
        
        addSubview(newsTitle)
        NSLayoutConstraint.activate([
            newsTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            newsTitle.heightAnchor.constraint(equalToConstant: 50),
            newsTitle.topAnchor.constraint(equalTo: self.topAnchor),
            newsTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
        
        addSubview(newsImage)
        NSLayoutConstraint.activate([
            newsImage.topAnchor.constraint(equalTo: newsTitle.bottomAnchor),
            newsImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            newsImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            newsImage.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    
    


}



