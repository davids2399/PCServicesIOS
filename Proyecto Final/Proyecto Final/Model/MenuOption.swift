//
//  MenuOption.swift
//  Proyecto Final
//
//  Created by David Salazar on 03/05/20.
//  Copyright © 2020 llWolfz. All rights reserved.
//
import UIKit

enum MenuOption: Int, CustomStringConvertible {
    case Build
    case Apartment
    case Computer
    case Report
    
    var description: String {
        switch self {
            case .Build: return "Tecnicos"
            case .Apartment: return "Empresas"
            case .Computer: return "Equipos"
            case .Report: return "Reportes"
        }
    }

    var image: UIImage {
        switch self {
        case .Build: return UIImage(named: "BuildIcon") ?? UIImage()
        case .Apartment: return UIImage(named: "ApartmentIcon") ?? UIImage()
        case .Computer: return UIImage(named: "ComputerIcon") ?? UIImage()
        case .Report: return UIImage(named: "ReportIcon") ?? UIImage()
        }
    }
}
