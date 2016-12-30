import UIKit

class MyTabBarController: UITabBarController {
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  override var childViewControllerForStatusBarStyle: UIViewController? {
    return nil
  }
}
