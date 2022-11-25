//
//  AppDelegate.swift
//  Calulator
//
//  Created by Dunyagozel Durdyyeva on 11/8/22.
//

import UIKit
import Parse
import FatSecretSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    enum Constants {
            static let apiKey = "0cfbab0d92bb4a25a9e9a6fa6592a547"
            static let apiSecret = "b131862ba8644fd291258b619b0418e5"
        }

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let parseConfig = ParseClientConfiguration {
                    //$0.applicationId = "JsqqdShpG8SoIu3VCJSXRmXEVnoQmGpzZ5ksuVd1" // <- UPDATED
                    //$0.clientKey = "t1Prr9wMW1JnBxe3BRBVEtWrEPIeJVk4O1kZi15F" // <- UPDATED
                    //$0.server = "https://parseapi.back4app.com"
            
                                $0.applicationId = "0GvHpu4UJlomCUa1C8Q96EroRVv4dQkFdPBhtIjR"
                               $0.clientKey = "5zaw3MN2hcy5OFJNaa3l3jKzZyzcli8qW499CQYu"
                               $0.server = "https://parseapi.back4app.com"
            
        }
            Parse.initialize(with: parseConfig)
        
        FatSecretCredentials.setConsumerKey(Constants.apiKey)
        FatSecretCredentials.setSharedSecret(Constants.apiSecret)
        
        
        
        return true
        
    
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

