
//  MovieDetailsVC.swift
//  MyFavoriteMovies
//
//  Created by Salwa on 4/15/18.
//  Copyright © 2018 Developers2Be. All rights reserved.
//

import UIKit

class MovieDetailsVC: UIViewController {

    @IBOutlet weak var movieImage: UIImageView!
    
    
    @IBOutlet weak var movieName: UILabel!
    
    
    @IBOutlet weak var movieDesc: UITextView!
    
    
    var movieNameText = String ()
    var movieDescText = String ()
    var movieImg = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        movieName.text = movieNameText
        movieDesc.text = movieDescText
        movieImage.image = movieImg
        
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
