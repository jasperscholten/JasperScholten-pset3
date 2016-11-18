//
//  SearchViewController.swift
//  JasperScholten-pset3
//
//  Created by Jasper Scholten on 15-11-16.
//  Copyright © 2016 Jasper Scholten. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var movieInput: UITextField!
    
    var moviePlot = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func searchMovie(_ sender: Any) {
        
        // http://stackoverflow.com/questions/38292793/http-requests-in-swift-3
        
        // bij tweede query: SO_NOAPNFALLBK failed: [42] Protocol not available, dumping backtrace
        // enum HTTPError
        
        let url = URL(string: "https://www.omdbapi.com/?t=" + movieInput.text! + "&y=&plot=full&r=json")

        
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
                    // print(json)
                    // print(json["Plot"]!)
                    
                    self.moviePlot = json["Plot"] as! String
                    
                    // DispatchQueue.main.async {
                    //     self.label.text = json.value(forKey: "imd]bRating") as! String?
                    // }
                    
                    // do it again to retrieve the poster - be smart
                    
                }
            }
            task.resume()
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let showMovie = segue.destination as? MovieShowViewController {
            showMovie.movieInfo = self.moviePlot
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
