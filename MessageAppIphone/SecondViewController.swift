//
//  SecondViewController.swift
//  MessageAppIphone
//
//  Created by Camilo Orjuela on 6/01/22.
//  Copyright © 2022 Camilo Orjuela. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var describeMovie: UILabel!
    @IBOutlet weak var episode: UILabel!
    @IBOutlet weak var opening: UILabel!
    @IBOutlet weak var director: UILabel!
    @IBOutlet weak var producer: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    
    var selectedMovie:Int?
    var showMovie: [OneMovie]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        describeMovie.text = showMovie?[selectedMovie!].title
        //episode.text = showMovie?[selectedMovie!].episode_id)
        opening.text = showMovie?[selectedMovie!].opening_crawl
        director.text = showMovie?[selectedMovie!].director
        producer.text = showMovie?[selectedMovie!].producer
        releaseDate.text = showMovie?[selectedMovie!].release_date
        
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
