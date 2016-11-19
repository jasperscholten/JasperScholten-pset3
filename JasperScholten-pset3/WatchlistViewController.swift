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
    var movies = [String]()
    var years = [String : String]()
    var posters = [String: String]()
    
    func storeMovie() {
        let defaults = UserDefaults.standard
        
        let movieName = movieInfo["Title"] as? String
        let movieYear = movieInfo["Year"] as? String
        let movieImage = movieInfo["Poster"] as? String
        
        // movies.append(movieName)
        // should append movie to array of movies, so we can access that array through the function readMovie and subsequently display it in the Watchlist. At this moment, we delete the saved settings and set it to a new value.
        
        defaults.set(movieName, forKey: "movie")
        defaults.set(movieYear, forKey: "year")
        defaults.set(movieImage, forKey: "poster")
        defaults.synchronize()
    }
    
    func readMovie() {
        
        let defaults = UserDefaults.standard
        let nameStored = defaults.string(forKey: "movie")
        let yearStored = defaults.string(forKey: "year")
        let imageStored = defaults.string(forKey: "poster")
        
        if nameStored != nil {
            movies.append(nameStored!)
            years[nameStored!] = yearStored!
            posters[nameStored!] = imageStored
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if movieInfo["Title"] != nil{
            storeMovie()
        }
        readMovie()
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
        // Don't know how to get image from - "Poster": <UIImage: 0x600000096a30>, {300, 433},
        // cell.moviePoster.image = posters[movies[indexPath.row]]
        
        if let year = years[movies[indexPath.row]] {
            cell.movieSubtitle.text = year
        } else {
            cell.movieSubtitle.text = "" 
        }
        
        return cell
        
    }

}
