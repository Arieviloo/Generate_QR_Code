//
//  AppDelegate.swift
//  GenerateQRCode
//
//  Created by Jadië Oliveira on 25/04/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

 var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		window = UIWindow(frame: UIScreen.main.bounds)
		window?.rootViewController = UINavigationController(rootViewController: HomeViewController())
		window?.makeKeyAndVisible()
		
		return true
	}

}

