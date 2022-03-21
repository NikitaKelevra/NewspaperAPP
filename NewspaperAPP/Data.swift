//
//  Data.swift
//  NewspaperAPP
//
//  Created by Сперанский Никита on 20.03.2022.
//

//import Foundation


// Взято с сайта https://newsapi.org/s/russia-news-api
// Get запрос https://newsapi.org/v2/top-headlines?country=ru&apiKey=API_KEY

class Data {
    static let shared = Data()
    
    private init() {}
    
    let apiKey = "2d11d6b520594f1ea9f0bd3feabfdf12"
    
    let urlAdress = "https://newsapi.org/v2/top-headlines?country=ru&apiKey=2d11d6b520594f1ea9f0bd3feabfdf12"
    
}
