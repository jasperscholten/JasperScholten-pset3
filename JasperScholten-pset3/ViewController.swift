//
//  ViewController.swift
//  JasperScholten-pset3
//
//  Created by Jasper Scholten on 15-11-16.
//  Copyright © 2016 Jasper Scholten. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // http://stackoverflow.com/questions/38292793/http-requests-in-swift-3
        
        // bij tweede query: SO_NOAPNFALLBK failed: [42] Protocol not available, dumping backtrace
        // enum HTTPError
        
        let url = URL(string: "https://www.omdbapi.com/?t=star+wars&y=&plot=full&r=json")
        
        if url == nil {
            print("Empty string")
        } else {
            let task = URLSession.shared.dataTask(with: url!) { data, response, error in
                guard error == nil else {
                    print(error!)
                    return
                }
                guard let data = data else {
                    print("Data is empty")
                    return
                }
                
                let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [String:AnyObject]
                
                if json["Error"] != nil {
                    print(json["Error"]!)
                } else {
                    print(json)
                    
                    // DispatchQueue.main.async {
                    //     self.label.text = json.value(forKey: "imd]bRating") as! String?
                    // }
                    
                    // do it again to retrieve the poster - be smart
                    
                }
            }
            
            task.resume()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

