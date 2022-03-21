//
//  NewsModel.swift
//  NewspaperAPP
//
//  Created by Сперанский Никита on 15.03.2022.
//

import Foundation



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
