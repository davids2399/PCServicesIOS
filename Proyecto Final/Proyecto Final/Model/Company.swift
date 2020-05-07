//
//  Company.swift
//  Proyecto Final
//
//  Created by David Salazar on 04/05/20.
//  Copyright © 2020 llWolfz. All rights reserved.
//

import UIKit

class Company {
    var idCompany: String
    var name: String
    var email: String
    var created_at: String
    
    init?(idCompany: String, name: String, email: String, created_at: String) {            
        self.idCompany = idCompany
        self.name = name
        self.email = email
        self.created_at = created_at
    }
}
