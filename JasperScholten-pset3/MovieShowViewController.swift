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
    
    // http://stackoverflow.com/questions/24231680/loading-downloading-image-from-url-on-swift
    func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
    
    func downloadImage(url: URL) {
        getDataFromUrl(url: url) { (data, response, error)  in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { () -> Void in
                self.moviePoster.image = UIImage(data: data)
                self.movieInfo["Poster"] = UIImage(data: data)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(movieInfo)
        
        movieTitle.text = movieInfo["Title"] as? String
        year.text = movieInfo["Year"] as? String
        director.text = movieInfo["Director"] as? String
        actors.text = movieInfo["Actors"] as? String
        plot.text = movieInfo["Plot"] as? String
        let movieUrl = movieInfo["Poster"] as? String
        
        // http://stackoverflow.com/questions/24231680/loading-downloading-image-from-url-on-swift
        if let checkedUrl = URL(string: movieUrl!) {
            moviePoster.contentMode = .scaleAspectFit
            downloadImage(url: checkedUrl)
        }
    }

    @IBAction func addToList(_ sender: Any) {
        // Possibly appending movieInfo to userdefault array here?
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
