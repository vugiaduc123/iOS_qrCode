//
//  AppDelegate.swift
//  qrCard
//
//  Created by Vũ Đức on 8/1/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow()
        let infoViewModel = InfoUserViewModel()
        let view = InfoUserViewController(viewModel: infoViewModel)
        let nav = UINavigationController(rootViewController: view)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        return true
    }
}

