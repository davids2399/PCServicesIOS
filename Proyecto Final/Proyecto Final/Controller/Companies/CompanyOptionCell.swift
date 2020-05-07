//
//  MenuOptionCell.swift
//  Proyecto Final
//
//  Created by David Salazar on 03/05/20.
//  Copyright © 2020 llWolfz. All rights reserved.
//

import UIKit

class CompanyOptionCell: UITableViewCell {
    
    let companyName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let companyEmail: UILabel = {
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
        //companyName.heightAnchor.constraint(equalToConstant: 20).isActive = true
        //companyName.widthAnchor.constraint(equalToConstant: 200).isActive = true
        //companyName.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        companyName.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        companyName.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        companyName.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        //companyName.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        addSubview(companyEmail)
        companyEmail.translatesAutoresizingMaskIntoConstraints = false
        //companyEmail.heightAnchor.constraint(equalToConstant: 200).isActive = true
        //companyEmail.widthAnchor.constraint(equalToConstant: 200).isActive = true
        //companyEmail.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        companyEmail.topAnchor.constraint(equalTo: companyName.topAnchor).isActive = true
        companyEmail.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        companyEmail.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        companyEmail.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
