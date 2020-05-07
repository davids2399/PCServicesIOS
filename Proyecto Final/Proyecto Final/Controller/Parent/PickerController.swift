//
//  CompanyPicker.swift
//  Proyecto Final
//
//  Created by David Salazar on 06/05/20.
//  Copyright © 2020 llWolfz. All rights reserved.
//
import UIKit

class PickerController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
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
