//
//  SettingsController.swift
//  Proyecto Final
//
//  Created by David Salazar on 04/05/20.
//  Copyright © 2020 llWolfz. All rights reserved.
//

import UIKit

class UsersController: HomeController, UITableViewDelegate,  UITableViewDataSource  {
    
    var users = [User]()
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
        navigationItem.title = "Tecnicos"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "AddIcon")?.withRenderingMode(.alwaysOriginal),
            style: .plain,
            target: self,
            action: #selector(addUser)
        )
    }
    
    @objc func addUser() {
        let controller = AddUsersController()
        present(UINavigationController(rootViewController: controller), animated: true, completion: {
            self.fetchUsers()
        })
    }
    
    func setUpTable() {
        fetchUsers()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UserOptionCell.self, forCellReuseIdentifier: "cellId")
        
        view.addSubview(tableview)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableview.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableview.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! UserOptionCell
        cell.backgroundColor = UIColor.white
        cell.userName.text = "Nombre: " + self.users[indexPath.row].name + " " + self.users[indexPath.row].lastname
        cell.userEmail.text = "Correo: " + self.users[indexPath.row].email
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func fetchUsers() {
        users = []
        var request = URLRequest(url: URL(string: "http://144.202.67.253:3000/api/users")!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                for element in json["data"] as! [AnyObject] {
                    var user = User(idUser: "", name: "", lastname: "", email: "")
                    for (key, value) in element as! Dictionary<String, AnyObject> {
                        switch key {
                        case "name":
                            user?.name = value as! String
                            break
                        case "lastname":
                            user?.lastname = value as! String
                            break
                        case "email":
                            user?.email = value as! String
                            break
                        case "idUser":
                            user?.idUser = value.stringValue
                            break
                        default:
                            break
                        }
                    }
                    self.users.append(user!)
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
