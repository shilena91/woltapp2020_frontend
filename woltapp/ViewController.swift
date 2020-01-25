//
//  ViewController.swift
//  woltapp
//
//  Created by Hoang Pham on 25.1.2020.
//  Copyright © 2020 Hoang Pham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var restaurantData = [RestaurantData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let fileLocation = Bundle.main.url(forResource: "restaurants", withExtension: "json")
        {
            if let data = try? Data(contentsOf: fileLocation)
            {
                parse(json: data)
            }
        }
        var i = 0
        while (i < restaurantData.count)
        {
            print(Int(restaurantData[i].distance))
            print("\n")
            i += 1
        }
    }
    
    func parse(json: Data)
    {
        let decoder = JSONDecoder()
        if let dataFromJson = try? decoder.decode(Restaurant.self, from: json)
        {
            restaurantData = dataFromJson.restaurants
            sort()
        }
    }

    func sort()
    {
        countDistance()
        sortOnline()
        sortLocation()
    }
    
    func sortOnline()
    {
        var i = 0
        
        while i < (restaurantData.count - 1)
        {
            if restaurantData[i].online == false
            {
                if restaurantData[i + 1].online == true
                {
                    restaurantData.swapAt(i, i + 1)
                    i = -1
                }
            }
            i += 1
        }
    }
    
    func sortLocation()
    {
        var i = 0
        
        countDistance()
        while i < restaurantData.count - 1 && (restaurantData[i].online == restaurantData[i + 1].online)
        {
            if restaurantData[i].distance > restaurantData[i + 1].distance
            {
                restaurantData.swapAt(i, i + 1)
                i = -1
            }
            i += 1
        }
    }
    
    func countDistance()
    {
        var i = 0
        
        while i < restaurantData.count
        {
            restaurantData[i].distance = restaurantData[i].location[0] + restaurantData[i].location[1]
            i += 1
        }
    }
}
