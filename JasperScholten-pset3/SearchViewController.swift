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
    
    var movieInfo = [String: AnyObject]()
    
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
        
        let movie = movieInput.text!
        let search = String(movie.characters.map {
            $0 == " " ? "+" : $0
        })
        let url = URL(string: "https://www.omdbapi.com/?t=" + search + "&y=&plot=full&r=json")

        print(url!)
        
        if url == nil {
            print("Empty string")
            // self.movieInfo = info not found
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
                    // alert error
                    print(json["Error"]!)
                } else {

                    DispatchQueue.main.async {
                        self.movieInfo = json
                        self.performSegue(withIdentifier: "showSearch", sender: nil)
                    }
                }
            }
            task.resume()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let showMovie = segue.destination as? MovieShowViewController {
            showMovie.movieInfo = movieInfo
        }
    }

}
