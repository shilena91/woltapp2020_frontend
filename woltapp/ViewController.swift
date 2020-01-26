//
//  ViewController.swift
//  woltapp
//
//  Created by Hoang Pham on 25.1.2020.
//  Copyright © 2020 Hoang Pham. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView1: UITableView!
    var restaurantData = [RestaurantData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView1.delegate = self
        tableView1.dataSource = self
        
        parse()
        tableView1.rowHeight = 400
    }
    
    func parse()
    {
        if let fileLocation = Bundle.main.url(forResource: "restaurants", withExtension: "json")
        {
            if let data = try? Data(contentsOf: fileLocation)
            {
                let decoder = JSONDecoder()
                if let dataFromJson = try? decoder.decode(Restaurant.self, from: data)
                {
                    restaurantData = dataFromJson.restaurants
                    sort()
                }

            }
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView1.dequeueReusableCell(withIdentifier: "table1", for: indexPath) as! TableViewCell
        let url = URL(string: restaurantData[indexPath.row].image)

        cell.restaurantImg.kf.setImage(with: url)
        cell.name.text = restaurantData[indexPath.row].name
        cell.descriptions.text = restaurantData[indexPath.row].restaurantDescription
        cell.delivery.text = "Delivery: \(restaurantData[indexPath.row].deliveryPrice / 100)" + ",90€"
        return (cell)
    }
}


