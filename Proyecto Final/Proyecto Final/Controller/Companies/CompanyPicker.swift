//
//  CompanyPicker.swift
//  Proyecto Final
//
//  Created by David Salazar on 06/05/20.
//  Copyright © 2020 llWolfz. All rights reserved.
//
import UIKit

class CompanyPicker: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    var companies = [Company]()
    var myPicker = UIPickerView()
    var pickerOptions: [String] = [] {
        didSet {
            myPicker.reloadAllComponents()
        }
    }
    var activePickerId: Int = 0

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickerOptions.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.pickerOptions[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.activePickerId = row
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func createPicker(frame: CGRect){
        fillPicker()
        let picker: UIPickerView = {
            let picker = UIPickerView()
            picker.dataSource = self
            picker.delegate = self
            picker.backgroundColor = .white
            picker.tintColor = .black
            return picker
        }()
        picker.frame = frame
        self.myPicker = picker
    }
    
    func getActiveCompanyId() -> String{
        return self.companies[self.activePickerId].idCompany
    }
    
    func fillPicker(){
        var temp: [String] = []
        bringData(completion: { result in
            for element in result["data"] as! [AnyObject] {
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
                temp.append(company!.name)
            }
            self.pickerOptions = temp
        }, url: "companies")
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
}
