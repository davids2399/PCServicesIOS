//
//  Reports.swift
//  Proyecto Final
//
//  Created by David Salazar on 06/05/20.
//  Copyright © 2020 llWolfz. All rights reserved.
//

import UIKit

class Service {
    var idService: String
    var name: String
    
    init?(idService: String, name: String) {
        self.idService = idService
        self.name = name
    }
}
