//
//  AppDelegate.swift
//  VKAllCups
//
//  Created by Djinsolobzik on 03.12.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        if #available(iOS 13.0, *) {
            window?.overrideUserInterfaceStyle = .dark
        }
        window?.rootViewController = FavoritesViewController()
        window?.makeKeyAndVisible()
        return true
    }

}

