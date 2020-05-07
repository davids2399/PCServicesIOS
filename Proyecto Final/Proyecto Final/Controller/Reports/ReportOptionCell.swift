//
//  MenuOptionCell.swift
//  Proyecto Final
//
//  Created by David Salazar on 03/05/20.
//  Copyright © 2020 llWolfz. All rights reserved.
//

import UIKit

class ReportOptionCell: UITableViewCell {
    
    let companyName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let computer: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let user: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let service: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    func setupView() {
        addSubview(companyName)
        companyName.translatesAutoresizingMaskIntoConstraints = false
        companyName.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        companyName.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        companyName.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        addSubview(computer)
        computer.translatesAutoresizingMaskIntoConstraints = false
        computer.topAnchor.constraint(equalTo: companyName.bottomAnchor).isActive = true
        computer.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        computer.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        addSubview(user)
        user.translatesAutoresizingMaskIntoConstraints = false
        user.topAnchor.constraint(equalTo: computer.bottomAnchor).isActive = true
        user.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        user.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        addSubview(service)
        service.translatesAutoresizingMaskIntoConstraints = false
        service.topAnchor.constraint(equalTo: user.bottomAnchor).isActive = true
        service.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        service.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
