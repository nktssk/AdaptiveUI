//
//  AppDelegate.swift
//  AdaptiveUI-Example
//
//  Created by n.sosyuk on 09.10.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UIViewController.swizzle()
        
        func log() {
            guard let data = try? JSONEncoder().encode(TableConfigurationBuilder.configuration),
                  let string = String(data: data, encoding: .utf8)
            else { return }

            //print("--------------Configuration-Start--------------")
            // print(string)
            //print("--------------Configuration-End--------------")
        }
        log()
        return true
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {}
}

