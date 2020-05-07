//
//  Reports.swift
//  Proyecto Final
//
//  Created by David Salazar on 06/05/20.
//  Copyright © 2020 llWolfz. All rights reserved.
//

import UIKit

class Report {
    var idReport: String
    var computer: String
    var company: String
    var user: String
    var service: String
    var visit_start_time: String
    var visit_end_time: String
    var description: String
    
    init?(idReport: String, computer: String, company: String, user: String, service: String, visit_start_time: String, visit_end_time: String, description: String) {
        self.idReport = idReport
        self.computer = computer
        self.company = company
        self.user = user
        self.service = service
        self.visit_start_time = visit_start_time
        self.visit_end_time = visit_end_time
        self.description = description
    }
}
