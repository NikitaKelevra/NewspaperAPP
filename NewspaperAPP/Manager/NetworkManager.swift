//
//  NetworkManager.swift
//  NewspaperAPP
//
//  Created by Сперанский Никита on 15.03.2022.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    let urlAdress = "ttps://newsapi.org/v2/top-headlines?country=ru&apiKey=API_KEY"
    
    func fetchNews() {
        guard let url = URL(string: urlAdress) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, let response = response else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            print(response)
            
            do {
                let news = try JSONDecoder().decode(News.self, from: data)
                print(news)
            } catch let error {
                print(error.localizedDescription)
            }
            
            
        }.resume()
        
    }
        
}
