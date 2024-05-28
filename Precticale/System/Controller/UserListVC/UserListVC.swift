//
//  UserListVC.swift
//  Precticale
//
//  Created by Kalpit Rathod on 12/05/24.
//

import UIKit
import TTSegmentedControl

class UserListVC: UIViewController {

    //MARK: - Outlet
    @IBOutlet var sgmt: TTSegmentedControl!
    @IBOutlet var tblView: UITableView!
    
    //MARK: - var
    var selectedInex = 0
    var userDataModel = GetUserListData()
    var postDataModel = GetPostData()

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerXIB()
        self.WSGetUserData()
        self.WSGetPostData()
        self.setupSegment()
    }
    
    //MARK: - Segment Func
    func setupSegment(){
        self.sgmt.selectedTextFont = .systemFont(ofSize: 14, weight: .medium)
        self.sgmt.defaultTextFont = .systemFont(ofSize: 14, weight: .medium)
        self.sgmt.selectedTextColor =  UIColor(named: "NDColor24136C")!
        self.sgmt.defaultTextColor = UIColor(named: "NDColor24136C")!
        self.sgmt.thumbGradientColors = [UIColor(named: "NDColor2BE2D9")!,UIColor(named: "NDColor0071FF")!]
        self.sgmt.itemTitles = ["UserList","ViewPost"]
        self.sgmt.didSelectItemWith = { (index, title) -> () in
            self.selectedInex = index
            self.tblView.reloadData()
            self.tblView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        }
    }
    
}

//MARK: - TableView Method
extension UserListVC: UITableViewDataSource, UITableViewDelegate{
    func registerXIB(){
        self.tblView.registerCell(type: detailCell.self)
        self.tblView.delegate = self
        self.tblView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.selectedInex == 0 {
            return self.userDataModel.arrUserData.count
        } else {
            return self.postDataModel.arrPostData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! detailCell
        
        if self.selectedInex == 0 {
            cell.setUserData(dict: self.userDataModel.arrUserData[indexPath.row])
        } else {
            cell.setPostData(dict: self.postDataModel.arrPostData[indexPath.row])
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.selectedInex == 0 {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "UserInfoVC") as! UserInfoVC
            vc.userData = self.userDataModel.arrUserData[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        if self.selectedInex == 1 {
            let deleteAction = UIContextualAction(style: .normal, title:  "Delete", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
                self.WSDeletePost(id: "\(self.postDataModel.arrPostData[indexPath.row].internalIdentifier ?? 0)")
                success(true)
            })
            
            deleteAction.image = UIImage(named: "ic_delete")
            deleteAction.backgroundColor = .red
            
            let editAction = UIContextualAction(style: .normal, title:  "Edit", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
                self.displayErrorAlert(errorMessage: "Edit Sucesful")
                success(true)
            })
            
            editAction.image = UIImage(named: "Edit")
            editAction.backgroundColor = .green
            editAction.image?.withTintColor(.white)
            return UISwipeActionsConfiguration(actions: [deleteAction,editAction])
        }
        
        return nil

    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

//MARK: - Get API data
extension UserListVC {
    func WSGetUserData() {
        self.userDataModel.getUserListData(ViewController: self) { isSucess in
            self.tblView.reloadData()
        }
    }
    
    func WSDeletePost(id: String) {
        self.postDataModel.deletePostData(ViewController: self, id: id) { isSucess in
            self.WSGetPostData()
        }
    }
    
    func WSGetPostData() {
        self.postDataModel.getPostData(ViewController: self) { isSucess in
            self.tblView.reloadData()
        }
    }
}
