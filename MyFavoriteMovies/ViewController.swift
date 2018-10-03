//
//  ViewController.swift
//  MyFavoriteMovies
//
//  Created by Salwa on 4/12/18.
//  Copyright © 2018 Developers2Be. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage


class ViewController: UIViewController ,UITableViewDataSource , UITableViewDelegate {

    var Sections = [1]
    var Movies = [Movie] ()
    var index = 0
    var segueIdentifier = "cellSegue"
    let Movies_Url = "https://api.androidhive.info/json/movies.json"   //the Web API URL
    

    
    @IBOutlet weak var tableView: UITableView!
   
    @IBOutlet weak var TableViewList: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
         fetchMovies()
         }
    


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if  segue.identifier == segueIdentifier,
            let destination = segue.destination as? MovieDetailsVC,
            let Index = tableView.indexPathForSelectedRow?.row
        {
             destination.movieNameText = Movies[Index].title!
            
           // destination.movieDescText = Movies[Index].Desc!
            
            destination.movieImg = UIImage(named:Movies[Index].image!)!
        
        }
    
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return Sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:MovieCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieCell
        
            //getting the hero for the specified position
        
                 let movie: Movie
                 movie = Movies[indexPath.row]
        
                 cell.MovieName.text = Movies[indexPath.row].title!
                // cell.MovieDesc.text = Movies[indexPath.row].Desc!
        
          //displaying image
        
          Alamofire.request(movie.image!).responseImage { response in
            debugPrint(response)
            
            if let image = response.result.value {
                cell.MovieImage.image = image
            }
        }
        
               return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       // index = indexPath.row
        performSegue(withIdentifier: segueIdentifier, sender: self)
    
    }
    
    func fetchMovies(){
        //fetching data from web api
        Alamofire.request(Movies_Url).responseJSON { response in
            
            //getting json
            if let json = response.result.value {
                
                //converting json to NSArray
                let moviesArray : NSArray  = json as! NSArray
                
                //traversing through all elements of the array
                for i in 0..<moviesArray.count{
                    
                    //adding movie values to the Movies list
              
                    self.Movies.append(Movie(
                        title: ((moviesArray[i] as AnyObject).value(forKey: "title") as? String)!,
                        image: ((moviesArray[i] as AnyObject).value(forKey: "image") as? String)!)
                        
                  )
                 
                }
                
                //displaying data in tableview
                self.tableView.reloadData()
            }
            
        }
       
        self.tableView.reloadData()
        // Do any additional setup after loading the view, typically from a nib.
    
    }
    
    
    
    
  }
