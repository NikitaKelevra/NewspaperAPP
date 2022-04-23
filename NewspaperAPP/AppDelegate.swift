//
//  AppDelegate.swift
//  NewspaperAPP
//
//  Created by Сперанский Никита on 15.03.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        /// Инициализируем свойство Window через UIScreen
        window = UIWindow(frame: UIScreen.main.bounds)
        /// делаем свойство window основным объектом
        window?.makeKeyAndVisible()
        /// Делаем  UINavigationController стартовым - через него определяем NewsWeekCollectionViewController
        window?.rootViewController = UINavigationController(rootViewController: NewsWeekCollectionViewController())
        return true
    }
}

