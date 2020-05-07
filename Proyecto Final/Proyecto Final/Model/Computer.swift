//
//  User.swift
//  Proyecto Final
//
//  Created by David Salazar on 05/05/20.
//  Copyright © 2020 llWolfz. All rights reserved.
//

import UIKit

class Computer {
    var idComputer: String
    var company: String
    var brand: String
    var serial_number: String
    
    init?(idComputer: String, company: String, brand: String, serial_number: String) {
        self.idComputer = idComputer
        self.company = company
        self.brand = brand
        self.serial_number = serial_number
    }
}
