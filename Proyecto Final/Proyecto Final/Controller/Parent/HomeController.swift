 //
 //  ContainerController.swift
 //  Proyecto Final
 //
 //  Created by David Salazar on 03/05/20.
 //  Copyright © 2020 llWolfz. All rights reserved.
 //
 
 import UIKit
 
 class HomeController: UIViewController {
    
    var delegate: HomeControllerDelegate?
    
    // Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configureNavigationBar()
    }
    
    @objc func handleMenuToggle() {
        delegate?.handleMenuToggle(forMenuOption: nil)
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "PCServices"
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "MenuIcon"),
            style: .plain,
            target: self,
            action: #selector(handleMenuToggle)
        )
        navigationItem.leftBarButtonItem?.tintColor = .white
    }
 }
