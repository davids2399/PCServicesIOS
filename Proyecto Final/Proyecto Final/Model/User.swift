//
//  User.swift
//  Proyecto Final
//
//  Created by David Salazar on 05/05/20.
//  Copyright © 2020 llWolfz. All rights reserved.
//

import UIKit

class User {
    var idUser: String
    var name: String
    var lastname: String
    var email: String
    
    init?(idUser: String, name: String, lastname: String, email: String) {
        self.idUser = idUser
        self.name = name
        self.lastname = lastname
        self.email = email
    }
}
