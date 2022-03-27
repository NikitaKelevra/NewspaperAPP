//
//  NewWeekCell.swift
//  NewspaperAPP
//
//  Created by Сперанский Никита on 26.03.2022.
//

import UIKit

class NewsWeekCell: UICollectionViewCell {
    var viewModel: NewsCellViewModelProtocol! {
        didSet {
            var content = defaultContentConfiguration()
            content.
            
            contentConfiguration = content
        }
    }
}
