//
//  MovieShowViewController.swift
//  JasperScholten-pset3
//
//  Created by Jasper Scholten on 17-11-16.
//  Copyright © 2016 Jasper Scholten. All rights reserved.
//

import UIKit

class MovieShowViewController: UIViewController {

    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var director: UILabel!
    @IBOutlet weak var actors: UITextView!
    @IBOutlet weak var plot: UITextView!
    @IBOutlet weak var moviePoster: UIImageView!
    var movieInfo = [String: AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        movieTitle.text = movieInfo["Title"] as? String
        year.text = movieInfo["Year"] as? String
        director.text = movieInfo["Director"] as? String
        actors.text = movieInfo["Actors"] as? String
        plot.text = movieInfo["Plot"] as? String
        print(movieInfo["Plot"]!)
        print(movieInfo["Actors"]!)
    }

    @IBAction func addToList(_ sender: Any) {
        print("ADDED")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addMovie = segue.destination as? WatchlistViewController {
            addMovie.movieInfo = movieInfo
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
