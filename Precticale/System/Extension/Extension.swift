//
//  Extension.swift
//  Precticale
//
//  Created by Kalpit Rathod on 12/05/24.
//

import Foundation
import UIKit

extension UIViewController {
    func displayErrorAlert(errorMessage: String)
    {
        DispatchQueue.main.async {
            let errorAlert = UIAlertController(title: "Alert", message: errorMessage, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
            errorAlert.addAction(okAction)
            self.present(errorAlert, animated: true)
        }
    }
    func displayToast(errorMessage: String)
    {
        DispatchQueue.main.async {
            let errorAlert = UIAlertController(title: "Alert", message: errorMessage, preferredStyle: .alert)
            self.present(errorAlert, animated: true)
        }
    }
}

//MARK:- UITableView
public extension UITableView {
    
    func registerCell(type: UITableViewCell.Type, identifier: String? = nil) {
        let cellId = String(describing: type)
        register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: identifier ?? cellId)
    }
    
    func dequeueCell<T: UITableViewCell>(withType type: UITableViewCell.Type) -> T? {
        return dequeueReusableCell(withIdentifier: type.identifier) as? T
    }
    
    func dequeueCell<T: UITableViewCell>(withType type: UITableViewCell.Type, for indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withIdentifier: type.identifier, for: indexPath) as? T
    }
}

public extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}

//MARK:- API Response Status Code
extension URLResponse {
    func getStatusCode() -> Int? {
        if let httpResponse = self as? HTTPURLResponse {
            return httpResponse.statusCode
        }
        return nil
    }
}

func setAttributeString(str: String , str2: String) -> NSAttributedString {
    let myAttribute = [ NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .light)]
    let myAttribute2 = [ NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .semibold) ]
    let mutableAttributedString = NSMutableAttributedString()
    let attriString = NSAttributedString(string: str, attributes: myAttribute2)
    let attriString1 = NSAttributedString(string: str2, attributes: myAttribute)
    mutableAttributedString.append(attriString)
    mutableAttributedString.append(attriString1)
    return mutableAttributedString
}
