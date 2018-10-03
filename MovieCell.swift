//
//  MovieCell.swift
//  MyFavoriteMovies
//
//  Created by Salwa on 4/15/18.
//  Copyright © 2018 Developers2Be. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var MovieImage: UIImageView!
    
    @IBOutlet weak var MovieName: UILabel!
    
    
    @IBOutlet weak var MovieDesc: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
