//
//  AppDelegate.swift
//  Cachorros
//
//  Created by Maria Eduarda Tupich on 27/10/21.
//

import UIKit
import Kingfisher

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let api = API()
        if Reachability.isConnectedToNetwork() {
            self.window?.rootViewController = UINavigationController(rootViewController: ViewController(api: api))
            self.window?.makeKeyAndVisible()
        } else {
            self.window?.rootViewController = UINavigationController(rootViewController: TesteController())
            self.window?.makeKeyAndVisible()
        }
//        self.window?.rootViewController = UINavigationController(rootViewController: ViewController(api: api))
//        self.window?.makeKeyAndVisible()
        
        return true
    }

    
}
