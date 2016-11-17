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
    
    let movies = ["Inception", "Star Wars", "Up", "Inside Out"]
    let plots = [
        "Inception": "Dreams within dreams",
        "Star Wars": "Spaceships",
        "Up": "House with balloons",
        "Inside Out": "Talking emotions"
    ]
    
    // images
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        
        if let plot = plots[movies[indexPath.row]] {
            cell.movieSubtitle.text = plot
        } else {
            cell.movieSubtitle.text = "" 
        }
        
        return cell
        
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
