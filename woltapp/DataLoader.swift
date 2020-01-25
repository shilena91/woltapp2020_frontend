//
//  DataLoader.swift
//  woltapp
//
//  Created by Hoang Pham on 25.1.2020.
//  Copyright © 2020 Hoang Pham. All rights reserved.
//

import Foundation
/*
public class DataLoader
{
    var restaurantData = [RestaurantData]()
    
    init()
    {
        load()
        //sort()
    }
    
    func load()
    {
        if let fileLocation = Bundle.main.url(forResource: "restaurants", withExtension: "json")
        {
            // do catch in case of error
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode(Restaurant.self, from: data)
            
                restaurantData = dataFromJson
            }
            catch {
                print(error)
            }
        }
    }
    
    /*
    func sort()
    {
        distance()
        sortOnline()
        sortLocation()
    }
    
    func sortOnline()
    {
        var i = 0
        
        while !restaurantData[i].online && i < (restaurantData.count - 1)
        {
            if restaurantData[i + 1].online
            {
                restaurantData.swapAt(i, i + 1)
                i = -1
            }
            i += 1
        }
    }
    
    
    
    func sortLocation()
    {
        var i = 0
        
        distance()
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
    
    func distance()
    {
        var i = 0
        
        while i < restaurantData.count
        {
            restaurantData[i].distance = restaurantData[i].location[0].coordinate + restaurantData[i].location[1].coordinate
            i += 1
        }
    }
 */
}
*/
