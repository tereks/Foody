//
//  AppDelegate.swift
//  FoodSearch
//
//  Created by Sergey Kim on 05.02.2020.
//  Copyright © 2020 Sergey Kim. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var dependencyProvider: ApplicationDependenceProvider!
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        ApplicationConfigurator.configure(application: self)

        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = SearchFoodConfigurator.createWithNVC()
        window!.makeKeyAndVisible()

        return true
    }
}

