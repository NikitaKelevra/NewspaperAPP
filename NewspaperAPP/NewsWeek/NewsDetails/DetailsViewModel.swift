//
//  DetailsViewModel.swift
//  NewspaperAPP
//
//  Created by Сперанский Никита on 01.04.2022.
//

import Foundation

protocol DetailsViewModelProtocol {
    var title: String { get }
    var description: String { get }
    var imageData: Data? { get }
    
    init(article: Article)
}

class DetailsViewModel: DetailsViewModelProtocol {
    var title: String {
        article.title
    }
    
    var description: String {
        article.description ?? "Данные отсутствуют."
    }
    
    var imageData: Data? {
        ImageManager.shared.fetchImageData(from: article.urlToImage)
    }
    
    private let article: Article
    
    required init(article: Article) {
        self.article = article
    }
}
