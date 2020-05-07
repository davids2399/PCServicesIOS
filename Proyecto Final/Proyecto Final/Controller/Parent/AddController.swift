//
//  SettingsController.swift
//  Proyecto Final
//
//  Created by David Salazar on 04/05/20.
//  Copyright © 2020 llWolfz. All rights reserved.
//

import UIKit

class AddController: UIViewController {
    var pickers: [Any] = []
    struct formFields {
        var name: String
        var isPassword: Bool
        var type: String
        var picker: String
    }
    
    let sendButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func handleDismiss() {
        dismiss(animated: true, completion: nil)
    }
    
    func configureUI(title: String) {
        view.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barStyle = .black
        navigationItem.title = title
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "CloseIcon")?.withRenderingMode(.alwaysOriginal),
            style: .plain,
            target: self,
            action: #selector(handleDismiss)
        )
    }
    
    func configureForm(fields: [formFields]) {
        var y = 160
        for field in fields {
            let myLabel: UILabel = {
                let label = UILabel()
                label.textColor = .black
                label.font = UIFont.systemFont(ofSize: 18)
                label.text = field.name
                label.frame = CGRect(x:23, y: y, width: 370, height: 30)
                return label
            }()
            self.view.addSubview(myLabel)
            y = y + 35
            
            switch field.type {
            case "picker":
                switch field.picker {
                case "company":
                    let companyPicker = CompanyPicker()
                    companyPicker.start(frame: CGRect(x:23, y: y, width: 370, height: 70))
                    pickers.append(companyPicker)
                    self.view.addSubview(companyPicker.myPicker)
                    break
                case "user":
                    let userPicker = UserPicker()
                    userPicker.start(frame: CGRect(x:23, y: y, width: 370, height: 70))
                    pickers.append(userPicker)
                    self.view.addSubview(userPicker.myPicker)
                    break
                case "computer":
                    let computerPicker = ComputerPicker()
                    computerPicker.start(frame: CGRect(x:23, y: y, width: 370, height: 70))
                    pickers.append(computerPicker)
                    self.view.addSubview(computerPicker.myPicker)
                    break
                case "service":
                    let servicePicker = ServicePicker()
                    servicePicker.start(frame: CGRect(x:23, y: y, width: 370, height: 70))
                    pickers.append(servicePicker)
                    self.view.addSubview(servicePicker.myPicker)
                    break
                default:
                    break
                }
                y = y + 80
                break
            default:
                let myField: UITextField = UITextField(frame: CGRect(x:23, y: y, width: 370, height: 30))
                myField.borderStyle = .roundedRect
                myField.placeholder = field.name
                myField.isSecureTextEntry = field.isPassword
                self.view.addSubview(myField)
                y = y + 40
                break
            }
        }
        
        self.sendButton.frame = CGRect(x: 120, y: y, width: 100, height: 30)
        self.sendButton.setTitle("Enviar", for: .normal)
        self.sendButton.setTitleColor(.black, for: .normal)
        self.sendButton.backgroundColor = .lightGray
        self.view.addSubview(sendButton)
    }
    
    func bringData(completion: @escaping (Dictionary<String, AnyObject>)->() ,url: String){
        var request = URLRequest(url: URL(string: "http://144.202.67.253:3000/api/" + url)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                var json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                completion(json)
            } catch {
                print("error")
            }
        })
        task.resume()
    }
    
    func sendToApi(url: String, params: [String : Any]) {
        var request = URLRequest(url: URL(string: "http://144.202.67.253:3000/api/" + url)!)
        
        let data = try! JSONSerialization.data(withJSONObject: params, options: JSONSerialization.WritingOptions.prettyPrinted)
        
        let json = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
        
        if let json = json {  print(json) }
        
        let jsonData = json!.data(using: String.Encoding.utf8.rawValue);
        
        request.httpMethod = "POST"
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            self.handleDismiss()
        })
        
        task.resume()
    }
}
