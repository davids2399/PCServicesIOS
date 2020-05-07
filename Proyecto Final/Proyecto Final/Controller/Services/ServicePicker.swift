//
//  CompanyPicker.swift
//  Proyecto Final
//
//  Created by David Salazar on 06/05/20.
//  Copyright © 2020 llWolfz. All rights reserved.
//
import UIKit

class ServicePicker: PickerController {
    var services = [Service]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func start(frame: CGRect){
        self.fillPicker()
        super.createPicker(frame: frame)
    }
    
    func getActiveServiceId() -> String{
        return self.services[super.activePickerId].idService
    }
    
    func fillPicker(){
        var temp: [String] = []
        super.bringData(completion: { result in
            for element in result["data"] as! [AnyObject] {
                var service = Service(idService: "", name: "")
                for (key, value) in element as! Dictionary<String, AnyObject> {
                    switch key {
                    case "name":
                        service?.name = value as! String
                        break
                    case "idService":
                        service?.idService = value.stringValue
                        break
                    default:
                        break
                    }
                }
                self.services.append(service!)
                temp.append(service!.name)
            }
            self.pickerOptions = temp
        }, url: "services")
    }
}
