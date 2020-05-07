//
//  CompanyPicker.swift
//  Proyecto Final
//
//  Created by David Salazar on 06/05/20.
//  Copyright © 2020 llWolfz. All rights reserved.
//
import UIKit

class ComputerPicker: PickerController {
    var computers = [Computer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func start(frame: CGRect){
        self.fillPicker()
        super.createPicker(frame: frame)
    }
    
    func getActiveComputerId() -> String{
        return self.computers[super.activePickerId].idComputer
    }
    
    func fillPicker(){
        var temp: [String] = []
        super.bringData(completion: { result in
            for element in result["data"] as! [AnyObject] {
                var computer = Computer(idComputer: "", company: "", brand: "", serial_number: "")
                for (key, value) in element as! Dictionary<String, AnyObject> {
                    switch key {
                    case "company":
                        computer?.company = value as! String
                        break
                    case "brand":
                        computer?.brand = value as! String
                        break
                    case "idComputer":
                        computer?.idComputer = value.stringValue
                        break
                    case "serial_number":
                        computer!.serial_number = value as! String
                        break
                    default:
                        break
                    }
                }
                self.computers.append(computer!)
                var message = computer?.company as! String
                message += " "
                message += computer?.serial_number as! String
                temp.append(message)
            }
            self.pickerOptions = temp
        }, url: "computers?computerList=true")
    }
}
