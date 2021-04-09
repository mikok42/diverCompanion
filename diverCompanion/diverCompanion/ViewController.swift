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
    
    var diveSites = DiveSite.getData()
    var siteArrayIterator = 0
    
    func updateUI() {
        siteImage.image = UIImage(named: diveSites[siteArrayIterator].pictureName)
        siteName.text =  diveSites[siteArrayIterator].name
        siteLocation.text =  diveSites[siteArrayIterator].location
        siteDescription.text =  diveSites[siteArrayIterator].description
    }
    override func viewDidLoad() {
        siteDescription.sizeToFit()
        updateUI()
    }
    @IBAction func prevButtonPressed(_ sender: UIButton) {
        if siteArrayIterator > 0 {
            siteArrayIterator -= 1
        } else {
            siteArrayIterator = diveSites.count - 1
        }
        updateUI()
    }
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        if siteArrayIterator <= diveSites.count - 1 {
            siteArrayIterator += 1
        } else {
            siteArrayIterator = 0
        }
        updateUI()
    }
}
