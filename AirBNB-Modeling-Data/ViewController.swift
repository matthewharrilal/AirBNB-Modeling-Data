//
//  ViewController.swift
//  AirBNB-Modeling-Data
//
//  Created by Matthew Harrilal on 9/17/17.
//  Copyright © 2017 Matthew Harrilal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

struct Listing {
    // Declaring the properties we want from the JSON file
    
    let name: String?
    let pictureURL: String?
    let city: String?
    let bathrooms: Double?
    let neighborhood: String?
    init(firstName: String?,name:String?, pictureURL: String?, city:String?, bathrooms:Double?, neighborhood:String?) {
        self.firstName = firstName
        self.name = name
        self.pictureURL = pictureURL
        self.city = city
        self.bathrooms = bathrooms
        self.neighborhood = neighborhood
        // Essentially here what we are doing is that we are initalizing a new instance every time and we know that every instance is a new listing being made therefore we are modeling each new listing
    }
}
extension Listing: Decodable {
    
    enum Keys: String, Decodable {
        
        
    }
}
