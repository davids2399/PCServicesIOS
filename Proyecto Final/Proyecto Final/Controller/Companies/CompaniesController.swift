//
//  SettingsController.swift
//  Proyecto Final
//
//  Created by David Salazar on 04/05/20.
//  Copyright © 2020 llWolfz. All rights reserved.
//

import UIKit

class CompaniesController: HomeController, UITableViewDelegate,  UITableViewDataSource  {
    var companies = [Company]()
    let tableview: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = UIColor.white
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setUpTable()
    }
    
    @objc func handleDismiss() {
        dismiss(animated: true, completion: nil)
    }
    
    func configureUI() {
        navigationItem.title = "Empresas"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "AddIcon")?.withRenderingMode(.alwaysOriginal),
            style: .plain,
            target: self,
            action: #selector(addCompany)
        )
    }
    
    @objc func addCompany() {
        let controller = AddCompaniesController()
        present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
    }
    
    func setUpTable() {
        fetchCompanies()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(CompanyOptionCell.self, forCellReuseIdentifier: "cellId")
        
        view.addSubview(tableview)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableview.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableview.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.companies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! CompanyOptionCell
        cell.backgroundColor = UIColor.white
        cell.companyName.text = "Nombre: " + self.companies[indexPath.row].name
        cell.companyEmail.text = "Correo: " + self.companies[indexPath.row].email
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func fetchCompanies() {
        companies = []
        var request = URLRequest(url: URL(string: "http://144.202.67.253:3000/api/companies")!)
        request.httpMethod = "GET"
        // request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                for element in json["data"] as! [AnyObject] {
                    var company = Company(idCompany: "", name: "", email: "", created_at: "")
                    for (key, value) in element as! Dictionary<String, AnyObject> {
                        switch key {
                        case "name":
                            company?.name = value as! String
                        break
                        case "email":
                            company?.email = value as! String
                        break
                        case "idCompany":
                            company?.idCompany = value.stringValue
                        break
                        case "created_at":
                            company?.created_at = value as! String
                        break
                        default:
                            break
                        }
                    }
                    self.companies.append(company!)
                }
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
            } catch {
                print("error")
            }
        })
        
        task.resume()
    }
}
