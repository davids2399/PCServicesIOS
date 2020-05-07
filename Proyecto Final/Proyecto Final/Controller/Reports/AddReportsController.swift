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
        computerFields.append(formFields(name: "Empresa", isPassword: false, type: "picker", picker: "company"))
        computerFields.append(formFields(name: "Equipo", isPassword: false, type: "picker", picker: "computer"))
        computerFields.append(formFields(name: "Tecnico", isPassword: true, type: "picker", picker: "user"))
        computerFields.append(formFields(name: "Servicio", isPassword: true, type: "picker", picker: "service"))
        computerFields.append(formFields(name: "Descripcion", isPassword: false, type: "", picker: ""))
        
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
        let picker_1 = super.pickers[0] as! CompanyPicker
        let picker_2 = super.pickers[1] as! ComputerPicker
        let picker_3 = super.pickers[2] as! UserPicker
        let picker_4 = super.pickers[3] as! ServicePicker
        let params: [String : Any] = [
            "company_id": Int(picker_1.getActiveCompanyId()),
            "computer_id": Int(picker_2.getActiveComputerId()),
            "user_id": Int(picker_3.getActiveUserId()),
            "service_id": Int(picker_4.getActiveServiceId()),
            "visit_start_time": "2020-5-04",
            "description": answers[0],
            "visit_end_time": "2020-5-05",
            "created_at": "2020-5-05"
        ]
        super.sendToApi(url: "reports", params: params)
    }
}
