//
//  MenuOptionCell.swift
//  Proyecto Final
//
//  Created by David Salazar on 03/05/20.
//  Copyright © 2020 llWolfz. All rights reserved.
//

import UIKit

class UserOptionCell: UITableViewCell {
    
    let userName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let userEmail: UILabel = {
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
        addSubview(userName)
        userName.translatesAutoresizingMaskIntoConstraints = false
        userName.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        userName.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        userName.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        addSubview(userEmail)
        userEmail.translatesAutoresizingMaskIntoConstraints = false
        userEmail.topAnchor.constraint(equalTo: userName.topAnchor).isActive = true
        userEmail.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        userEmail.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        userEmail.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
