//
//  UserInfoVC.swift
//  Precticale
//
//  Created by Kalpit Rathod on 12/05/24.
//

import UIKit
import GoogleMaps

class UserInfoVC: UIViewController {

    //MARK: - Outlet
    @IBOutlet var map_view: GMSMapView!
    @IBOutlet var txtFldWebsite: UITextField!
    @IBOutlet var txtFldCompny: UITextField!
    @IBOutlet var txtFldPhoneNO: UITextField!
    @IBOutlet var txtFldAdress: UITextField!
    @IBOutlet var txtFldEmail: UITextField!
    @IBOutlet var lblUserName: UILabel!
    @IBOutlet var imgUser: UIImageViewX!
    
    //MARK: - Var
    var userData : ModelBaseUserList!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtFldEmail.text = self.userData.email
        self.txtFldPhoneNO.text = self.userData.phone
        let fullAdress = (self.userData.address?.suite ?? "") + (self.userData.address?.street ?? "") + (self.userData.address?.city ?? "")
        self.txtFldAdress.text = fullAdress
        self.txtFldCompny.text = self.userData.company?.name
        self.txtFldWebsite.text = self.userData.website
        self.lblUserName.text = self.userData.username
        self.addMarkers()
    }
    
    //MARK: - helper Func
    func addMarkers() {
        self.map_view.clear()
        let lat = Double(self.userData.address?.geo?.lat ?? "") ?? 0.0
        let lng = Double(self.userData.address?.geo?.lng ?? "") ?? 0.0

        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        marker.title = self.userData.address?.suite ?? ""
        marker.snippet = self.userData.address?.city ?? ""
        marker.map = self.map_view

        self.map_view.animate(toLocation: CLLocationCoordinate2D(latitude: lat, longitude: lng))
    }
}
