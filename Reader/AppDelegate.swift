//
//  AppDelegate.swift
//  Reader
//
//  Created by Martin Richter on 17/09/15.
//  Copyright © 2015 Futurice. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        if let splitViewController = window?.rootViewController as? UISplitViewController {
            splitViewController.delegate = self
            if let navigationController = splitViewController.viewControllers.last as? UINavigationController {
                navigationController.topViewController?.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem()
            }
        }

        return true
    }

    func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController: UIViewController, ontoPrimaryViewController primaryViewController: UIViewController) -> Bool {
        // By default, the secondary (detail) view controller is shown when there is only room for one.
        // Returning true here causes it to collapse onto the primary (master) view controller.
        return true
    }
}
