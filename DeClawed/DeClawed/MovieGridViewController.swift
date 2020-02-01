//
//  MovieGridViewController.swift
//  DeClawed
//
//  Created by Brandon Elmore on 2/1/20.
//  Copyright © 2020 codepath. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieGridViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    
    @IBOutlet weak var CollectionView: UICollectionView!
    
    
    var Movies = [[String:Any]]()

    override func viewDidLoad() {
        
        CollectionView.delegate = self
        CollectionView.dataSource = self
        
        
        
        super.viewDidLoad()

        let url = URL(string: "https://api.themoviedb.org/3/movie/297762/similar?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
              let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
              let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
              let task = session.dataTask(with: request) { (data, response, error) in
                 // This will run when the network request returns
                 if let error = error {
                    print(error.localizedDescription)
                 } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                  
                  self.Movies = dataDictionary["results"] as! [[String:Any]]
                    self.CollectionView.reloadData()
                    


                 }
              }
              task.resume()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieGridCell", for: indexPath) as! MovieGridCell
        
        
        let movie = Movies[indexPath.item]
        
        
        let baseURL = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterURL = URL(string: baseURL + posterPath)!
        cell.PosterView.af_setImage(withURL: posterURL)
        
        
        
        
        return cell
    }

}
