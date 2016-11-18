//
//  WatchlistViewController.swift
//  JasperScholten-pset3
//
//  Created by Jasper Scholten on 15-11-16.
//  Copyright © 2016 Jasper Scholten. All rights reserved.
//

import UIKit

class WatchlistViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var watchlistTable: UITableView!
    
    // get everything from JSON
    var movieInfo = [String: AnyObject]()
    
    var movieJsons = [[String: AnyObject]]()
    var movies = [String]()
    var years = [String : String]()
    
    // images
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var movieName = movieInfo["Title"] as? String
        var movieYear = movieInfo["Year"] as? String
        
        print(movieName)
        
        if movieName != nil {
            movieJsons.append(movieInfo)
            movies.append(movieName!)
            years[movieName!] = movieYear!
            
            print("watchlist")
            print(movieInfo)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = watchlistTable.dequeueReusableCell(withIdentifier: "watchlistCell", for: indexPath) as! WatchListMovie
        
        cell.movieTitle.text = movies[indexPath.row]
        
        if let year = years[movies[indexPath.row]] {
            cell.movieSubtitle.text = year
        } else {
            cell.movieSubtitle.text = "" 
        }
        
        return cell
        
    }

}
