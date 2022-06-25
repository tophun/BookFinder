//
//  AppDelegate.swift
//  BookFinder
//
//  Created by Tophun on 2022/06/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        let searchViewController = SearchViewController()
        let navigationController = UINavigationController(rootViewController: searchViewController)

        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        return true
    }

}

