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
    
    var diveSites = [site1, site2]
    var siteArrayIterator = 0
    
    func updateUI(){
        siteImage.image =  #imageLiteral(resourceName:  diveSites[siteArrayIterator].giveData().3)  //tu sie kryje #imageLiteral(resourceName:  diveSites[siteArrayIterator].giveData().pictureName
        siteName.text =  diveSites[siteArrayIterator].giveData().name
        siteLocation.text =  diveSites[siteArrayIterator].giveData().location
        siteDescription.text =  diveSites[siteArrayIterator].giveData().description
    }
    override func viewDidLoad() {
        siteDescription.sizeToFit()
        updateUI()
    }
    
    @IBAction func prevButtonPressed(_ sender: UIButton) {
        if siteArrayIterator > diveSites.startIndex - 1 {
            siteArrayIterator -= 1
        } else {
            siteArrayIterator = diveSites.endIndex
        }
        updateUI()
    }
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        if siteArrayIterator < diveSites.endIndex + 1{
        siteArrayIterator += 1
        }else {
            siteArrayIterator = diveSites.startIndex
        }
        updateUI()
    }
}


let site1 = diveSite(_name: "Salem Wreck", _location: "Red Sea, Egypt", _description: description1, _pictureName: "salemWreck", _rating: 4)
let site2 = diveSite(_name: "Daedalus Reef", _location: "Red Sea, Egypt", _description: description2, _pictureName: "daedalusReef", _rating: 5)

let description1 = """
The Salem Express was a former 115m long passenger ferry which sank in 1991 at great human cost just south of Safaga. The immense tragedy of this event makes diving the Salem Express a unique experience that leaves a lasting impression on most scuba divers. She rests on her starboard side on a flat sand bottom at 27m of depth, with the shallowest section at just 7m.
"""
let description2 = """
Daedalus Reef (also known as Abu Kizan) is a 400-meter-long and 100-meter-wide (1,310–330 ft) standalone reef in the Egyptian Red Sea situated about 90 kilometers from Marsa Alam. There is a small artificial island in the center of the reef, which hosts a lighthouse constructed in 1863 and rebuilt in 1931. Daedalus reef is a well-known place for diving because of good chances to see pelagic fish, such as hammerhead sharks, and an abundance of corals. In the high season one can find many dive safari boats staying overnight, anchored to the reef.
"""

