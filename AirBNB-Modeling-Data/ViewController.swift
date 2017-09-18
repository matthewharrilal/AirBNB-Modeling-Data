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
        let network1 = Network()
        print(network1.networking())
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
    init(name:String?, pictureURL: String?, city:String?, bathrooms:Double?, neighborhood:String?) {
        self.name = name
        self.pictureURL = pictureURL
        self.city = city
        self.bathrooms = bathrooms
        self.neighborhood = neighborhood
        // Essentially here what we are doing is that we are initalizing a new instance every time and we know that every instance is a new listing being made therefore we are modeling each new listing
    }
}
extension Listing: Decodable {
    enum firstLayer: String, CodingKey {
        case listing
    }
    enum additionalKeys: String, CodingKey {
        case name
        case pictureURL = "picture_url"
        case city
        case bathrooms
        case neighborhood
        
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: firstLayer.self)
        let nestedContainer = try container.nestedContainer(keyedBy: additionalKeys.self, forKey: .listing)
        let name = try nestedContainer.decodeIfPresent(String.self, forKey: .name)
        let pictureURL = try nestedContainer.decodeIfPresent(String.self, forKey: .pictureURL)
        let city = try nestedContainer.decodeIfPresent(String.self, forKey: .city)
        let bathrooms = try nestedContainer.decodeIfPresent(Double.self, forKey: .bathrooms)
        let neighborhood = try nestedContainer.decodeIfPresent(String.self, forKey: .neighborhood)
        self.init(name: name, pictureURL: pictureURL, city: city, bathrooms: bathrooms, neighborhood: neighborhood)
    }
}
struct ListingLists: Decodable {
    let search_results: [Listing]
}
class Network {
    func networking() {
        let session = URLSession.shared
        var getRequest = URLRequest(url: URL(string: "https://api.airbnb.com/v2/search_results?key=915pw2pnf4h1aiguhph5gc5b2")!)
        getRequest.httpMethod = "GET"
        session.dataTask(with: getRequest) { (data, response, error) in
            if let data = data {
             let airBNB = try? JSONDecoder().decode(ListingLists.self, from: data)
                print(airBNB)
            }
        }.resume()
        
    }
}
