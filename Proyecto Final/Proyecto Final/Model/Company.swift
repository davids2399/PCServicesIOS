//
//  Company.swift
//  Proyecto Final
//
//  Created by David Salazar on 04/05/20.
//  Copyright © 2020 llWolfz. All rights reserved.
//

import UIKit

class Company {
    var idCompany: Int
    var name: String
    var email: String
    var createdAt: String
    
    init?(idCompany: Int, name: String, email: String, createdAt: String) {
        if name.isEmpty || email.isEmpty {
            return nil
        }
            
        self.idCompany = idCompany
        self.name = name
        self.email = email
        self.createdAt = createdAt
    }
}
