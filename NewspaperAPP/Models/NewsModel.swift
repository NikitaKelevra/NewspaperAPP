//
//  NewsModel.swift
//  NewspaperAPP
//
//  Created by Сперанский Никита on 15.03.2022.
//

import Foundation

// Взято с сайта https://newsapi.org/s/russia-news-api
// Get запрос ttps://newsapi.org/v2/top-headlines?country=ru&apiKey=API_KEY

struct News: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Info]
}

struct Info: Decodable {
    let source: SourceNews
    let author: String?
    let title: String
    let description: String
    let url: URL
    let urlToImage: URL
    let publishedAt: String
    let content: String
}

struct SourceNews: Decodable {
    let id: String?
    let name: String

}
