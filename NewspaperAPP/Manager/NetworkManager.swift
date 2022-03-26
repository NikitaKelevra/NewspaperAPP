//
//  NetworkManager.swift
//  NewspaperAPP
//
//  Created by Сперанский Никита on 15.03.2022.
//

import Foundation
import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    private let urlAdress = "https://newsapi.org/v2/top-headlines?country=ru&apiKey=2d11d6b520594f1ea9f0bd3feabfdf12"

    // MARK: - Function
    func fetchNews(completion: @escaping (_ news: News) -> Void) {
        
        guard let url = URL(string: urlAdress) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else { return }
            
            do {
                let news = try JSONDecoder().decode(News.self, from: data)
                DispatchQueue.main.async {
                    completion(news)
                }
                print("Новости пришли")
                
            } catch let error {
                print("Произошла ошибка парсинга - \(error.localizedDescription)")
                debugPrint("Ключ парсинга отсутствует или опечатан - \(error)")
            }
            
        }.resume()   
    }
        
    
}
