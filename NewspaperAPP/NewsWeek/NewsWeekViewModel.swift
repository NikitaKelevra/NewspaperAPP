//
//  NewsWeekViewModel.swift
//  NewspaperAPP
//
//  Created by Сперанский Никита on 24.03.2022.
//

import Foundation

protocol NewsWeekCollectionViewModelProtocol: AnyObject {
    var articles: [Article] { get }
    func fetchNews(complition: @escaping() -> Void)
    func numberOfItems() -> Int
    func cellViewModel(at indexPath: IndexPath) -> NewsCellViewModelProtocol
    
}

// MARK: - Class
class NewsWeekViewModel: NewsWeekCollectionViewModelProtocol {
    
    var articles: [Article] = []

    func fetchNews(complition: @escaping () -> Void) {
        NetworkManager.shared.fetchNews { news in
//            self.news = news
            self.articles = news.articles
            complition()
        }
    }
    
    func numberOfItems() -> Int {
        articles.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> NewsCellViewModelProtocol {
        let article = articles[indexPath.row]
        return NewsCellViewModel(articles: article)
    }
    
//    private var news: News = ()
    
}
