//
//  SettingsController.swift
//  Proyecto Final
//
//  Created by David Salazar on 04/05/20.
//  Copyright © 2020 llWolfz. All rights reserved.
//

import UIKit

class CompaniesController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        fetchCompanies()
    }
    
    @objc func handleDismiss() {
        dismiss(animated: true, completion: nil)
    }
    
    func configureUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Empresas"
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.leftBarButtonItem =
            UIBarButtonItem(image: UIImage(named: "CloseIcon"), style: .plain, target: self, action: #selector(handleDismiss))
    }
    
    func fetchCompanies() {
        // let params = ["username":"john", "password":"123456"] as Dictionary<String, String>
        
        var request = URLRequest(url: URL(string: "http://144.202.67.253:3000/api/companies")!)
        request.httpMethod = "GET"
        // request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            print(response!)
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                print(json)
            } catch {
                print("error")
            }
        })
        
        task.resume()
    }
}
