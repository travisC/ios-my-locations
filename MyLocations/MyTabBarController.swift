//
//  MyTabBarController.swift
//  MyLocations
//
//  Created by Travis Cunningham on 12/29/16.
//  Copyright © 2016 Travis Cunningham. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override var childViewControllerForStatusBarStyle: UIViewController? {
        return nil
    }
}
