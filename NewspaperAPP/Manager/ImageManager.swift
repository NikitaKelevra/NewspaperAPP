//
//  ImageManager.swift
//  NewspaperAPP
//
//  Created by Сперанский Никита on 26.03.2022.
//

import Foundation

class ImageManager {
    static let shared = ImageManager()
    
    private init() {}
    
    func fetchImageData(from string: String?) -> Data? {
        guard let url = URL(string: string!) else { return nil }
        guard let imageData = try? Data(contentsOf: url) else { return nil }
        return imageData
    }
}
