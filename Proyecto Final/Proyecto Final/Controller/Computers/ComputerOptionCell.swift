//
//  MenuOptionCell.swift
//  Proyecto Final
//
//  Created by David Salazar on 03/05/20.
//  Copyright © 2020 llWolfz. All rights reserved.
//

import UIKit

class ComputerOptionCell: UITableViewCell {
    let company: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let computerBrand: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let computerSerialNumber: UILabel = {
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
        addSubview(company)
        company.translatesAutoresizingMaskIntoConstraints = false
        company.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        company.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        company.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        addSubview(computerBrand)
        computerBrand.translatesAutoresizingMaskIntoConstraints = false
        computerBrand.topAnchor.constraint(equalTo: company.bottomAnchor).isActive = true
        computerBrand.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        computerBrand.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        addSubview(computerSerialNumber)
        computerSerialNumber.translatesAutoresizingMaskIntoConstraints = false
        computerSerialNumber.topAnchor.constraint(equalTo: computerBrand.bottomAnchor).isActive = true
        computerSerialNumber.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        computerSerialNumber.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        computerSerialNumber.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
