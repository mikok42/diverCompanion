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
    
    var diveSites: [DiveSite] = []
    var siteArrayIterator = 0
    let url: String = "https://raw.githubusercontent.com/mikok42/diverCompanion/master/diverCompanion/diverCompanion/siteData.json"
    
    let parser = JSONParser.sharedParser
    
    func updateUI() {  
        siteImage.image = UIImage(named: diveSites[siteArrayIterator].pictureName)
        siteName.text =  diveSites[siteArrayIterator].name
        siteLocation.text =  diveSites[siteArrayIterator].location
        siteDescription.text =  diveSites[siteArrayIterator].description
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parser.readFromURL(fromURL: url) { [self] (data) in
            do {
                guard let data = data else { return }
                let tempdiveSites: [DiveSite] = try parser.parse(jsonData: data)
                diveSites = tempdiveSites
                DispatchQueue.main.async {
                    updateUI()
                }
            } catch {
                print(error)
            }
        }
        
//        do {
//            let localData = try parser.readLocalFile(forName: "siteData")
//            let tempdiveSites: [DiveSite] = try parser.parse(jsonData: localData)
//            diveSites = tempdiveSites
//            updateUI()
//        } catch {
//            print(error)
//        }
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
        if siteArrayIterator  < diveSites.count - 1 {
            siteArrayIterator += 1
        } else {
            siteArrayIterator = 0
        }
        updateUI()
    }
}
