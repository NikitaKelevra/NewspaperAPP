//
//  NewsWeekViewModel.swift
//  NewspaperAPP
//
//  Created by Сперанский Никита on 24.03.2022.
//

import Foundation

protocol NewsWeekViewModelProtocol {
    
    var totalResults: String { get }
    
    init (news: News)
}


class NewsWeekViewModel: NewsWeekViewModelProtocol {
    
    var totalResults: String {
        "Найдено результатов:\(news.totalResults)"
    }
    
    
    
    
    private let news: News
    
    required init(news: News) {
        self.news = news
    }
    
    
    
}
