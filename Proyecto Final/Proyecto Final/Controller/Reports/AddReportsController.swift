//
//  SettingsController.swift
//  Proyecto Final
//
//  Created by David Salazar on 04/05/20.
//  Copyright © 2020 llWolfz. All rights reserved.
//

import UIKit

class AddReportsController: AddController {
    var reports = [Report]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.configureUI(title: "Crear Reporte")
        
        var computerFields: [formFields] = []
        computerFields.append(formFields(name: "Empresa", isPassword: false, type: "picker"))
        computerFields.append(formFields(name: "Equipo", isPassword: false, type: "picker"))
        computerFields.append(formFields(name: "Tecnico", isPassword: true, type: "picker"))
        computerFields.append(formFields(name: "Service", isPassword: true, type: "picker"))

        super.configureForm(fields: computerFields)
        super.sendButton.addTarget(super.self, action: #selector(self.sendReport), for: .touchUpInside)
    }
    
    @objc func sendReport() {
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
        
        let params: [String : Any] = ["brand": answers[0], "serial_number": answers[1], "company_id": answers[2]]
        
        super.sendToApi(url: "reports", params: params)
    }
}
