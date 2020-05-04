 //
//  ContainerController.swift
//  Proyecto Final
//
//  Created by David Salazar on 03/05/20.
//  Copyright © 2020 llWolfz. All rights reserved.
//

import UIKit
 
 class ContainerController: UIViewController {
    // Properties
    
    var menuController: MenuController!
    var centerController: UIViewController!
    var isExpanded = false
    // Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeController()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    override var prefersStatusBarHidden: Bool{
        return isExpanded
    }
    
    // HAndlers
    func configureHomeController() {
        let homeController = HomeController()
        homeController.delegate = self
        centerController = UINavigationController(rootViewController: homeController)
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    
    func configureMenuController() {
        if menuController == nil {
            menuController = MenuController()
            menuController.delegate = self
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
        }
    }
    
    func animatePanel(shouldExpand: Bool, menuOption: MenuOption?) {
        if shouldExpand {
            UIView.animate(
                withDuration: 0.3,
                delay: 0,
                usingSpringWithDamping: 0.8,
                initialSpringVelocity: 0,
                options: .curveEaseInOut,
                animations: {
                    self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 80
                },
                completion: nil
            )
        } else {
            UIView.animate(
                withDuration: 0.5,
                delay: 0,
                usingSpringWithDamping: 0.8,
                initialSpringVelocity: 0,
                options: .curveEaseInOut,
                animations: {
                    self.centerController.view.frame.origin.x = 0
            }) {(_) in
                guard let menuOption = menuOption else { return }
                self.didSelectMenuOption(menuOption: menuOption)
            }
        }
        
        animateStatusBar()
    }
    
    func didSelectMenuOption(menuOption: MenuOption) {
        switch menuOption {
        case .Build:
            print("show Build")
        case .Apartment:
            let controller = CompaniesController()
            present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
            print("show Build")
        case .Computer:
            print("show Build")
        case .Report:
            print("show Build")
        }
    }
    
    func animateStatusBar() {
        UIView.animate(
            withDuration: 0.3,
            delay: 0,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: 0,
            options: .curveEaseInOut,
            animations: {
                self.setNeedsStatusBarAppearanceUpdate()
        },
            completion: nil
        )
    }
 }
 
 
 extension ContainerController: HomeControllerDelegate {
    func handleMenuToggle(forMenuOption menuOption: MenuOption?) {
        if !isExpanded {
            configureMenuController()
        }
        
        isExpanded = !isExpanded
        animatePanel(shouldExpand: isExpanded, menuOption: menuOption)
    }
 }
