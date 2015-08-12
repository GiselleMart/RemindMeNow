//
//  AppDelegate.swift
//  RemindMeNow
//
//  Created by Giselle Martinez on 7/17/15.
//  Copyright (c) 2015 Giselle Martinez. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        application.registerUserNotificationSettings(UIUserNotificationSettings(forTypes: UIUserNotificationType.Sound |
            UIUserNotificationType.Alert | UIUserNotificationType.Badge, categories: nil))
        
        UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName:UIFont(name:"HelveticaNeue-Thin",size:24)!, NSForegroundColorAttributeName:UIColor.whiteColor()]
        //[snippet, caption="Register User Notification Settings"]
        func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
            
            application.registerUserNotificationSettings(UIUserNotificationSettings(forTypes: UIUserNotificationType.Sound |
                UIUserNotificationType.Alert | UIUserNotificationType.Badge, categories: nil))
            
            return true
        }

        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        
    }

    func applicationDidEnterBackground(application: UIApplication) {
        
            }

    func applicationWillEnterForeground(application: UIApplication) {
            }

    func applicationDidBecomeActive(application: UIApplication) {
            }

    func applicationWillTerminate(application: UIApplication) {
        
    }

}

