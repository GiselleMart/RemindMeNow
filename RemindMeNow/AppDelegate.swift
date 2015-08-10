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
        UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName:UIFont(name:"HelveticaNeue-Thin",size:24)!, NSForegroundColorAttributeName:UIColor.whiteColor()]
        //NotificationSettings(forTypes: .Alert | .Badge | .Sound, categories: nil) // types are UIUserNotificationType members
        
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

