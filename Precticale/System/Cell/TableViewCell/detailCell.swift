//
//  detailCell.swift
//  Precticale
//
//  Created by Kalpit Rathod on 12/05/24.
//

import UIKit

class detailCell: UITableViewCell {

    //MARK: - Outlet
    @IBOutlet var img: UIImageView!
    @IBOutlet var lblPhoneNo: UILabel!
    @IBOutlet var lblEmail: UILabel!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var viewBG: UIView!
    
    //MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: - UserList
    func setUserData(dict: ModelBaseUserList) {
        if let str = dict.name, str.count > 0 {
            self.lblName.attributedText = setAttributeString(str: "Name:- ", str2: str)
        } else {
            self.lblName.text = ""
        }
        
        if let str = dict.email , str.count > 0 {
            self.lblEmail.isHidden = false
            self.lblEmail.attributedText = setAttributeString(str: "Email:- ", str2: str)
        } else {
            self.lblEmail.text = ""
        }
        
        
        if let str = dict.phone, str.count > 0 {
            self.lblPhoneNo.attributedText = setAttributeString(str: "Phone No:- ", str2: str)
        } else {
            self.lblPhoneNo.text = ""
        }
        
        self.img.image = UIImage(named: "Placeholder")
    }
    
    //MARK: - PostList
    func setPostData(dict: ModelBaseViewPost) {
        if let str = dict.title, str.count > 0 {
            self.lblName.attributedText = setAttributeString(str: "Tital:- ", str2: str)
        } else {
            self.lblName.text = ""
        }
        
        self.lblEmail.isHidden = true
        
        if let str = dict.body, str.count > 0 {
            self.lblPhoneNo.attributedText = setAttributeString(str: "Body:- ", str2: str)
        } else {
            self.lblPhoneNo.text = ""
        }
        
        self.img.image = UIImage(named: "Placeholder")
    }

}
