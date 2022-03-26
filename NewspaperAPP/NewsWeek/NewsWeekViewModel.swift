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
    
    init (news: News)
}

// MARK: - Class
class NewsWeekViewModel: NewsWeekCollectionViewModelProtocol {
    var articles: [Article] {
        news.articles
    }

    func fetchNews(complition: @escaping () -> Void) {
        NetworkManager.shared.fetchNews { news in
            self.news = news
            complition()
        }
    }
    
    func numberOfItems() -> Int {
        articles.count
    }
    
    private var news: News
    
    required init(news: News) {
        self.news = news
    }
}
