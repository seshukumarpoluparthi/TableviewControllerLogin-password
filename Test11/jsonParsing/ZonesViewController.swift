//
//  ZonesViewController.swift
//  Test11
//
//  Created by apple on 11/24/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

struct models_jsonObj {
    let farmName : String
    let filedName : [field_obj]
}



class ZonesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var Farms_obj = [farm_obj]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "seshu")
        tableView.tableFooterView = UIView()
        let jsonurl = "http://shamba.exaact.co:8085/Rancher/farmer/farmsAndFieldsList"
        let url = URL(string: jsonurl)
        var request = URLRequest(url: url!)
        let token = "d07de094-82b0-4f21-bd0f-b95b0bec6bff"
        request.httpMethod = "GET"
        request.setValue(token, forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data , error == nil , response != nil else{
                print("something is wrong")
                return
            }
            DispatchQueue.main.async {
                do{
                    let resp = try JSONDecoder().decode(ModelZones.self, from: data)
                    self.Farms_obj = resp.result
                    for i in resp.result{
                        print(i.fieldsList)
                        
                
                        
                        
                        
                    }
                    
                   
                    
                    
                    
                    print(self.Farms_obj)
                    self.tableView.reloadData()
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
}

extension ZonesViewController : UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return Farms_obj.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Farms_obj[section].farmName
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Farms_obj[section].fieldsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "seshu", for: indexPath)
        cell.textLabel?.text = Farms_obj[indexPath.section].fieldsList[indexPath.row].fieldName
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
}
