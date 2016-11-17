//
//  MovieShowViewController.swift
//  JasperScholten-pset3
//
//  Created by Jasper Scholten on 17-11-16.
//  Copyright © 2016 Jasper Scholten. All rights reserved.
//

import UIKit

class MovieShowViewController: UIViewController {

    var movieInfo: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("test")
        print(movieInfo!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
