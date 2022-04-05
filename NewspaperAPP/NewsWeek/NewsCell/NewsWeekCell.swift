//
//  NewWeekCell.swift
//  NewspaperAPP
//
//  Created by Сперанский Никита on 26.03.2022.
//

import UIKit

class NewsWeekCell: UICollectionViewCell {
    
    //MARK: - Properties

    private var heightOfItem: CGFloat = 30
    
    private let newsTitle = UILabel()
    private let newsDescription = UILabel()
    private let newsImage = UIImageView()
    private let itemStack = UIStackView()
    
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
        
//        let layoutAttributes = super.preferredLayoutAttributesFitting(layoutAttributes)
//
//        let fittingSize = UIView.layoutFittingCompressedSize
//
//        layoutAttributes.frame.size = systemLayoutSizeFitting(
//          fittingSize,
//          withHorizontalFittingPriority: .fittingSizeLevel,
//          verticalFittingPriority: .fittingSizeLevel
//        )

        return layoutAttributes
    }
    
    
    private func setupElements() {
//        newsTitle.translatesAutoresizingMaskIntoConstraints = false
//        newsTitle.backgroundColor = .green
        newsTitle.numberOfLines = 0
        newsTitle.font = .systemFont(ofSize: 17)
        newsTitle.textAlignment = .center
        newsTitle.baselineAdjustment = .alignCenters
        
        
//        newsImage.translatesAutoresizingMaskIntoConstraints = false
        newsImage.contentMode = .scaleAspectFit
        newsImage.clipsToBounds = false
        
        itemStack.addArrangedSubview(newsTitle)
        itemStack.addArrangedSubview(newsImage)
        itemStack.axis = .vertical
        itemStack.alignment = .center
        itemStack.contentMode = .scaleAspectFit
        itemStack.spacing = 5
        
        itemStack.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(itemStack)
        
        NSLayoutConstraint.activate([
            itemStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            itemStack.heightAnchor.constraint(equalTo: self.heightAnchor),
            itemStack.topAnchor.constraint(equalTo: self.topAnchor),
            itemStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
        
    }
    
    
    


}



