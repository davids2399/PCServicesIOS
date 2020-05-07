//
//  CompanyPicker.swift
//  Proyecto Final
//
//  Created by David Salazar on 06/05/20.
//  Copyright © 2020 llWolfz. All rights reserved.
//
import UIKit

class UserPicker: PickerController {
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func start(frame: CGRect){
        self.fillPicker()
        super.createPicker(frame: frame)
    }
    
    func getActiveUserId() -> String{
        return self.users[super.activePickerId].idUser
    }
    
    func fillPicker(){
        var temp: [String] = []
        super.bringData(completion: { result in
            for element in result["data"] as! [AnyObject] {
                var user = User(idUser: "", name: "", lastname: "", email: "")
                for (key, value) in element as! Dictionary<String, AnyObject> {
                    switch key {
                    case "name":
                        user?.name = value as! String
                        break
                    case "email":
                        user?.email = value as! String
                        break
                    case "idUser":
                        user?.idUser = value.stringValue
                        break
                    case "lastname":
                        user?.lastname = value as! String
                        break
                    default:
                        break
                    }
                }
                self.users.append(user!)
                temp.append(user!.name)
            }
            self.pickerOptions = temp
        }, url: "users")
    }
}
