//
//  NewWeekCell.swift
//  NewspaperAPP
//
//  Created by Сперанский Никита on 26.03.2022.
//

import UIKit

class NewsWeekCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
//    let newsTitle = UILabel()
//    let newsDescription = UILabel()
//    let newsImage = UIImageView()
    
    var viewModel: NewsCellViewModelProtocol! {
        didSet {
            
            self.titleLabel.text = viewModel.title
            self.descriptionLabel.text = viewModel.description
            
            guard let imageData = viewModel.imageData else { return }
            self.newsImageView.image = UIImage(data: imageData)
            
            
        }
        
        
    }
}
