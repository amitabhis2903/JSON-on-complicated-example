//
//  ViewController.swift
//  JSON on complicated example
//
//  Created by Ammy Pandey on 24/07/17.
//  Copyright © 2017 Ammy Pandey. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var actorArray = [AnyObject]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //declaring url of json
        let url = URL(string: "http://microblogging.wingnity.com/JSONParsingTutorial/jsonActors")!
        
        // declaring request of url
        let request = NSMutableURLRequest(url: url)
        
        //executing request
        URLSession.shared.dataTask(with: request as URLRequest) { (data: Data?, response: URLResponse?, error: Error?) in
            
            //error
            if error != nil {
                print ("Error: \(String(describing: error))?")
            }
            
            // get json data
            do{
                //store json data in new constant
                
                let json =  try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                
                //Secured way to declare new constant to store data
                guard let parssedJSON = json else{
                    print("Error while parsing \(String(describing: error))?")
                    return
                }
                
                guard let actorJson = parssedJSON["actors"] else {
                    print("Error while parsing data \(String(describing: error))?")
                    return
                }
                
                print(actorJson)
                
                self.actorArray = actorJson as! [AnyObject]
                self.tableView.reloadData()
                
            }catch{
                print("Error Caught \(error)")
            }
        }.resume()
        
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actorArray.count
    }
    
    //cell config
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //declaring custom cell with refrence to TableViewCell.swift
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        let name = actorArray[indexPath.row]["name"]
        let country = actorArray[indexPath.row]["country"]
        
        cell.actorName.text = name as? String
        cell.actorCountry.text = country as? String
        
        //got url 1 by 1 of every object of array as string
        let imageUrlString = actorArray[indexPath.row]["image"] as! String
        
        //coverted string to url
        let imageUrl = URL(string: imageUrlString)
        
        //loaded data from url
        
        let imageData = NSData(contentsOf: imageUrl!)
        
        //loaded data to imageView
        
        cell.actorImg.image = UIImage(data: (imageData as Data?)!)
        
        return cell
    }

}

