//
//  NewsCellViewModel.swift
//  NewspaperAPP
//
//  Created by Сперанский Никита on 26.03.2022.
//

import Foundation

protocol NewsCellViewModelProtocol {
    var title: String { get }
    var description:String { get }
    var imageData: Data? { get }
//    var heightOfItem: Float { get }
    init(articles: Article)
}

class NewsCellViewModel: NewsCellViewModelProtocol {
    
    var title: String {
        articles.title
    }
    
    var description: String {
        articles.description ?? "Данные отсутствуют."
    }
    
    var imageData: Data? {
        ImageManager.shared.fetchImageData(from: articles.urlToImage)
    }
    
//    var heightOfItem: Float
    
    private let articles: Article
    
    required init(articles: Article) {
        self.articles = articles
    }
}
