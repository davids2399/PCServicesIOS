//
//  SettingsController.swift
//  Proyecto Final
//
//  Created by David Salazar on 04/05/20.
//  Copyright © 2020 llWolfz. All rights reserved.
//

import UIKit

class AddCompaniesController: AddController {
    override func viewDidLoad() {
        super.viewDidLoad()
        super.configureUI(title: "Añadir Empresa")
        
        var companyFields: [formFields] = []
        companyFields.append(formFields(name: "Nombre", isPassword: false, type: "", picker: ""))
        companyFields.append(formFields(name: "Email", isPassword: false, type: "", picker: ""))
        companyFields.append(formFields(name: "Contraseña", isPassword: true, type: "", picker: ""))
        super.configureForm(fields: companyFields)
        
        super.sendButton.addTarget(super.self, action: #selector(self.sendCompany), for: .touchUpInside)
    }
    
    @objc func sendCompany() {
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

        let params: [String : Any] = ["name": answers[0], "email": answers[1], "password": answers[2]]
        
        super.sendToApi(url: "companies", params: params)
    }
}
