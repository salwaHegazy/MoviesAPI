//
//  Movie.swift
//  MyFavoriteMovies
//
//  Created by Salwa on 4/15/18.
//  Copyright © 2018 Developers2Be. All rights reserved.
//

import UIKit

class Movie{
    
    var title        : String?
    var image        : String?
    var rating       : Double?
    var releaseYear  : Int?
    var genre        : [String]?
    
    
    init( title : String , image : String ) {
        
        self.title  = title
        self.image  = image
       
    }
    

}
