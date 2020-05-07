//
//  SettingsController.swift
//  Proyecto Final
//
//  Created by David Salazar on 04/05/20.
//  Copyright © 2020 llWolfz. All rights reserved.
//

import UIKit

class AddUsersController: AddController {    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.configureUI(title: "Añadir Tecnico")
        
        var userFields: [formFields] = []
        userFields.append(formFields(name: "Nombre(s)", isPassword: false, type: ""))
        userFields.append(formFields(name: "Apellidos", isPassword: false, type: ""))
        userFields.append(formFields(name: "Email", isPassword: false, type: ""))
        userFields.append(formFields(name: "Contraseña", isPassword: true, type: ""))
        super.configureForm(fields: userFields)
        
        super.sendButton.addTarget(super.self, action: #selector(self.sendUser), for: .touchUpInside)
    }
    
    @objc func sendUser() {
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
        
        let params: [String : Any] = ["name": answers[0], "lastname": answers[1], "email": answers[2], "password": answers[3]]
        
        super.sendToApi(url: "users", params: params)
    }
}
