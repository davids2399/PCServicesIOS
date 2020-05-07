//
//  SettingsController.swift
//  Proyecto Final
//
//  Created by David Salazar on 04/05/20.
//  Copyright © 2020 llWolfz. All rights reserved.
//

import UIKit

class ComputersController: HomeController, UITableViewDelegate,  UITableViewDataSource  {
    
    var computers = [Computer]()
    
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
        navigationItem.title = "Equipos"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "AddIcon")?.withRenderingMode(.alwaysOriginal),
            style: .plain,
            target: self,
            action: #selector(addComputer)
        )
    }

    @objc func addComputer() {
        let controller = AddComputersController()
        present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
    }
    
    func setUpTable() {
        fetchComputers()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(ComputerOptionCell.self, forCellReuseIdentifier: "cellId")
        
        view.addSubview(tableview)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableview.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableview.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.computers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! ComputerOptionCell
        cell.backgroundColor = UIColor.white
        cell.company.text = "Empresa: " + self.computers[indexPath.row].company
        cell.computerBrand.text = "Marca: " + self.computers[indexPath.row].brand
        cell.computerSerialNumber.text = "No. Serie: " + self.computers[indexPath.row].serial_number
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func fetchComputers() {
        computers = []
        var request = URLRequest(url: URL(string: "http://144.202.67.253:3000/api/computers?computerList=true")!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                for element in json["data"] as! [AnyObject] {
                    var computer = Computer(idComputer: "", company: "", brand: "", serial_number: "")
                    for (key, value) in element as! Dictionary<String, AnyObject> {
                        switch key {
                        case "brand":
                            computer?.brand = value as! String
                            break
                        case "serial_number":
                            computer?.serial_number = value as! String
                            break
                        case "company":
                            computer?.company = value as! String
                            break
                        case "idComputer":
                            computer?.idComputer = value.stringValue
                            break
                        default:
                            break
                        }
                    }
                    self.computers.append(computer!)
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
