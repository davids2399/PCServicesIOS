//
//  SettingsController.swift
//  Proyecto Final
//
//  Created by David Salazar on 04/05/20.
//  Copyright © 2020 llWolfz. All rights reserved.
//

import UIKit

class AddComputersController: AddController {
    override func viewDidLoad() {
        super.viewDidLoad()        
        super.configureUI(title: "Añadir Equipo")
        
        var computerFields: [formFields] = []
        computerFields.append(formFields(name: "Marca", isPassword: false, type: "", picker: ""))
        computerFields.append(formFields(name: "No. Serie", isPassword: false, type: "", picker: ""))
        computerFields.append(formFields(name: "Empresa", isPassword: true, type: "picker", picker: "computer"))
        super.configureForm(fields: computerFields)
        super.sendButton.addTarget(super.self, action: #selector(self.sendComputer), for: .touchUpInside)
    }
    
    
    @objc func sendComputer() {
        var results = [UITextField]()
        for subview in view.subviews as [UIView] {
            if let textField = subview as? UITextField {
                results += [textField]
            }
        }
        
        var answers: [String] = []
        for txtField in results
        {
            answers.append(txtField.text as! String!)
        }
        let picker = super.pickers[0] as! CompanyPicker
        let params: [String : Any] = ["brand": answers[0], "serial_number": answers[1], "company_id": Int(picker.getActiveCompanyId())]
        
        super.sendToApi(url: "computers", params: params)
    }
}
