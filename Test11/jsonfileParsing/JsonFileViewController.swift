//
//  JsonFileViewController.swift
//  Test11
//
//  Created by apple on 11/23/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit


struct Custom_dict {
    var type : String
    var authors : [model_json]
}


class JsonFileViewController: UIViewController {
    
    @IBOutlet weak var JsonTableView: UITableView!
    
    
    var final_dict = [Custom_dict]()
    
    var figures = [model_json]()
    var figuresByLetter = [(key: String, value: [model_json])]()
    
    var cnt = [country_obj]()
    
    var mistery = [model_json]()
    var allauthors = [model_json]()
    var response : Welcome!
    var custArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        JsonTableView.delegate = self
        JsonTableView.dataSource = self
        
        
        let path = Bundle.main.path(forResource: "DataSource", ofType: "json")
        let data = NSData(contentsOfFile: path!)
        do{
            response = try JSONDecoder().decode(Welcome.self, from: data! as Data)
            
            for(key , value) in response{
                let resp = Custom_dict(type: key, authors: value)
            final_dict.append(resp)
            }
            print(final_dict)
            
            
            for k in response.keys{
//                print(k)
                mistery = response["\(k)"]!
                //  print(res["\(k)"]!)
                for i in mistery{
                    allauthors.append(i)
//                    print(i.authorName)
                }
            }
            print(allauthors)
            
            
            JsonTableView.reloadData()
        } catch{
            print(error.localizedDescription)
        }
    }
    
    
    
    @IBAction func btn_parse(_ sender: Any) {
        let path = Bundle.main.path(forResource: "DataSource", ofType: "json")
        let data = NSData(contentsOfFile: path!)
        do{
            response = try JSONDecoder().decode(Welcome.self, from: data! as Data)
            print(response.keys)
            
            for k in response.keys{
                print(k)
                custArray.append(k)
                mistery = response["\(k)"]!
              //  print(res["\(k)"]!)
                for i in mistery{
                    
                    print(i.authorName)
                }
            }
            
//            mistery = res["Genre : Mystery"]!
//            for i in mistery{
//                print(i.authorName)
//                print(i.coverImage)
//            }
            /*
            let res = try JSONDecoder().decode(Welcome1.self, from: data! as Data)
            for i in res{
                print(i.stateId ?? 0)
                print(i.stateName ?? "")
            }
           */
            
        } catch{
            print(error.localizedDescription)
        }
    }
}

extension JsonFileViewController : UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return final_dict.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return final_dict[section].type
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return final_dict[section].authors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JsonTableViewCell", for: indexPath) as! JsonTableViewCell
        cell.lbl_title.text = final_dict[indexPath.section].authors[indexPath.row].authorName.rawValue
        return cell
    }
}
