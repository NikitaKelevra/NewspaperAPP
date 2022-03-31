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
    
    let newsTitle = UILabel()
    let newsDescription = UILabel()
    let newsImage = UIImageView()
    let imageAndDescriptionStack = UIStackView()
    
    //MARK: - viewModel
    
    var viewModel: NewsCellViewModelProtocol! {
        didSet {
            
            self.newsTitle.text = viewModel.title
            self.newsDescription.text = viewModel.description
            
            guard let imageData = viewModel.imageData else {
                newsImage.isHidden = true
                return
            }
            self.newsImage.image = UIImage(data: imageData)
        }
    }
    
    //MARK: - Override init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupElements()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Private funcs
    
    private func setupElements() {
        newsTitle.translatesAutoresizingMaskIntoConstraints = false
        
        
        imageAndDescriptionStack.addArrangedSubview(newsImage)
        imageAndDescriptionStack.addArrangedSubview(newsDescription)
        imageAndDescriptionStack.translatesAutoresizingMaskIntoConstraints = false
        imageAndDescriptionStack.axis = .horizontal
        imageAndDescriptionStack.distribution = .fill
        
        
        
        imageAndDescriptionStack.backgroundColor = .brown
        
        

    }
        
    private func setupConstraints() {
        
        addSubview(newsTitle)
        
        NSLayoutConstraint.activate([
            newsTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            newsTitle.heightAnchor.constraint(equalTo: newsTitle.widthAnchor),
            newsTitle.topAnchor.constraint(equalTo: self.topAnchor),
            newsTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
        
        addSubview(imageAndDescriptionStack)
        NSLayoutConstraint.activate([
            imageAndDescriptionStack.topAnchor.constraint(equalTo: newsTitle.bottomAnchor),
            imageAndDescriptionStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageAndDescriptionStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageAndDescriptionStack.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        
    }
}
