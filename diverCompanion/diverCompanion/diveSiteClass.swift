//
//  diveSiteClass.swift
//  diverCompanion
//
//  Created by Mikołaj Linczewski on 09/04/2021.
//

import Foundation
import UIKit

class diveSite{
    private
    let name: String
    let description: String
    let location: String
    
    let rating: Int
   
    let pictureName: String
    //let picture: UIImage )
    
    init(_name: String, _location: String, _description: String, _pictureName: String, _rating: Int){
        name = _name
        description = _description
        location = _location
        rating = _rating
        pictureName = _pictureName
        
    }
    
    func giveData() ->(name: String, location: String, description: String, pictureName: String, rating: Int){
        return (name, location, description, pictureName , rating)
    }
    
}



