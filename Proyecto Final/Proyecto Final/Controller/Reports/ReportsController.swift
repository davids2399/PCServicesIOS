//
//  SettingsController.swift
//  Proyecto Final
//
//  Created by David Salazar on 04/05/20.
//  Copyright © 2020 llWolfz. All rights reserved.
//

import UIKit

class ReportsController: HomeController, UITableViewDelegate,  UITableViewDataSource  {
    
    var reports = [Report]()
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
        navigationItem.title = "Reportes"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "AddIcon")?.withRenderingMode(.alwaysOriginal),
            style: .plain,
            target: self,
            action: #selector(addReport)
        )
    }
    
    @objc func addReport() {
        let controller = AddReportsController()
        present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
    }
    
    func setUpTable() {
        fetchReports()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(ReportOptionCell.self, forCellReuseIdentifier: "cellId")
        
        view.addSubview(tableview)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableview.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableview.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.reports.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! ReportOptionCell
        cell.backgroundColor = UIColor.white
        cell.companyName.text = "Empresa: " + self.reports[indexPath.row].company
        cell.computer.text = "Computadora: " + self.reports[indexPath.row].computer
        cell.user.text = "Usuario: " + self.reports[indexPath.row].user
        cell.service.text = "Servicio: " + self.reports[indexPath.row].service
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func fetchReports() {
        reports = []
        var request = URLRequest(url: URL(string: "http://144.202.67.253:3000/api/reports?reportList=true")!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                for element in json["data"] as! [AnyObject] {
                    var report = Report(idReport: "", computer: "", company: "", user: "", service: "", visit_start_time: "", visit_end_time: "", description: "")
                    for (key, value) in element as! Dictionary<String, AnyObject> {
                        switch key {
                        case "computer":
                            report?.computer = value as! String
                            break
                        case "company":
                            report?.company = value as! String
                            break
                        case "idReport":
                            report?.idReport = value.stringValue
                            break
                        case "user":
                            report?.user = value as! String
                            break
                        case "service":
                            report?.service = value as! String
                            break
                        case "visit_start_time":
                            report?.visit_start_time = value as! String
                            break
                        case "visit_end_time":
                            report?.visit_end_time = value as! String
                            break
                        case "description":
                            report?.description = value as! String
                            break
                        default:
                            break
                        }
                    }
                    self.reports.append(report!)
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
