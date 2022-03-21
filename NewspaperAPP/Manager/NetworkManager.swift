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
    
    private let urlAdress = Data.shared.urlAdress
    
//    let alert = UIAlertController()

    // MARK: - Function
    func fetchNews() {
        guard let url = URL(string: urlAdress) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, let response = response else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            print(data)
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
