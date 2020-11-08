//
//  AppDelegate.swift
//  StripePaymentPOC
//
//  Created by Swetha Sreekanth on 8/11/20.
//  Copyright © 2020 DesiDesign. All rights reserved.
//

import UIKit
import Stripe

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var navigationController: UINavigationController?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        STPAPIClient.shared().publishableKey = Constants.privateKey
        setupRootViewController(launchOptions: launchOptions)
        return true
    }

    // MARK: UISceneSession Lifecycle
    
    func setupRootViewController(launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        if let window = window {
            let mainVC =  PaymentViewController()
            navigationController = UINavigationController(rootViewController: mainVC)
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }
    }
    


}

