//
//  GetUserListData.swift
//  Precticale
//
//  Created by Kalpit Rathod on 12/05/24.
//

import UIKit

class GetUserListData : NSObject {
    var arrUserData : [ModelBaseUserList] = []
    
    func getUserListData(ViewController: UIViewController,completion: @escaping (Bool) -> Void) {
        let parameters = [String : Any]()
        
        APIClient<ModelBaseUserList, ModelBaseUserList>().API_GET_ARRAY(Url: "https://jsonplaceholder.typicode.com/users" , Params: parameters as [String:AnyObject], Authentication: true, Progress: true, Alert: false, Offline: false, SuperVC: ViewController) { (modelResponse) in
            
            self.arrUserData.removeAll()
            self.arrUserData = modelResponse
            completion(true)
            
        } completionError: { (modelError,_) in
            print(modelError)
            ViewController.displayErrorAlert(errorMessage: "Somthing Wrong")
            completion(false)
        } completionFailed: { (modelError) in
            print(modelError.localizedDescription)
            ViewController.displayErrorAlert(errorMessage: modelError.localizedDescription)
            completion(false)
        }
    }
}
