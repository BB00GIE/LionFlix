//
//  MovieDetailsViewController.swift
//  DeClawed
//
//  Created by Brandon Elmore on 1/31/20.
//  Copyright © 2020 codepath. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {
    var movie: [String: Any]!
    @IBOutlet weak var backDrop: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var Synopsis: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let baseURL = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterURL = URL(string: baseURL + posterPath)!
        posterView.af_setImage(withURL: posterURL)
        
        titleLabel.text = movie["title"] as! String
        titleLabel.sizeToFit()
        Synopsis.text = movie["overview"] as! String
        Synopsis.sizeToFit()
        
        let backdropPath = movie["backdrop_path"] as! String
        let backdropURL = URL(string: "https://image.tmdb.org/t/p/w780" + backdropPath)!
        backDrop.af_setImage(withURL: backdropURL)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
