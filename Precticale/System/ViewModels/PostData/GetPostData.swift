//
//  GetPostData.swift
//  Precticale
//
//  Created by Kalpit Rathod on 12/05/24.
//

import Foundation
import UIKit

class GetPostData : NSObject {
    var arrPostData : [ModelBaseViewPost] = []
    
    func getPostData(ViewController: UIViewController,completion: @escaping (Bool) -> Void) {
        let parameters = [String : Any]()
        
        APIClient<ModelBaseViewPost, ModelBaseViewPost>().API_GET_ARRAY(Url: "https://jsonplaceholder.typicode.com/posts" , Params: parameters as [String:AnyObject], Authentication: true, Progress: true, Alert: false, Offline: false, SuperVC: ViewController) { (modelResponse) in
            
            self.arrPostData.removeAll()
            self.arrPostData = modelResponse
            
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
    
    func deletePostData(ViewController: UIViewController ,id: String ,completion: @escaping (Bool) -> Void) {
        let parameters = [String : Any]()
        
        APIClient<ModelBaseViewPost, ModelBaseViewPost>().API_DELETE(Url: "https://jsonplaceholder.typicode.com/posts/\(id)" , Params: parameters as [String:AnyObject], Authentication: true, Progress: true, Alert: false, Offline: false, SuperVC: ViewController) { (modelResponse) in
            
            ViewController.displayErrorAlert(errorMessage: "Post Delete Sucessful")
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
