//
//  ViewControllerX.swift
//  002 - Credit Card Checkout
//
//  Created by Kalpit Rathod on 12/05/24.
//

import UIKit

class UIViewControllerX: UIViewController {
    
    @IBInspectable var lightStatusBar: Bool = false
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            if lightStatusBar {
                return UIStatusBarStyle.lightContent
            } else {
                return UIStatusBarStyle.default
            }
        }
    }
}
