//
//  ViewController.swift
//  diverCompanion
//
//  Created by Mikołaj Linczewski on 09/04/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var siteImage: UIImageView!
    @IBOutlet weak var siteName: UILabel!
    @IBOutlet weak var siteLocation: UILabel!
    @IBOutlet weak var siteDescription: UILabel!
    
    override func viewDidLoad() {
        siteImage.image =  #imageLiteral(resourceName: site1.giveData().3) // tu sie kryje #imageLiteral(resourceName: site1.giveData().pictureName
        siteName.text = site1.giveData().name
        siteLocation.text = site1.giveData().location
        siteDescription.text = site1.giveData().description
    }
}

let site1 = diveSite(_name: "Salem Wreck", _location: "Red Sea, Egypt", _description: description1, _pictureName: "salemWreck", _rating: 4)

let description1 = """
The Salem Express was a former 115m long passenger ferry which sank in 1991 at great human cost just south of Safaga. The immense tragedy of this event makes diving the Salem Express a unique experience that leaves a lasting impression on most scuba divers. She rests on her starboard side on a flat sand bottom at 27m of depth, with the shallowest section at just 7m.
"""
