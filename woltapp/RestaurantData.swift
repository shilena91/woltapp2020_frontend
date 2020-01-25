//
//  RestaurantData.swift
//  woltapp
//
//  Created by Hoang Pham on 25.1.2020.
//  Copyright © 2020 Hoang Pham. All rights reserved.
//

import Foundation

struct Restaurant: Codable {
    let restaurants: [RestaurantData]
}

struct RestaurantData: Codable {
    let blurhash: String
    let city: City
    let currency: Currency
    let deliveryPrice: Int
    let restaurantDescription: String
    let image: String
    let location: [Double]
    let name: String
    var online: Bool
    let tags: [String]
    var distance: Double = 0.0

    enum CodingKeys: String, CodingKey {
        case blurhash, city, currency
        case deliveryPrice = "delivery_price"
        case restaurantDescription = "description"
        case image, location, name, online, tags
    }
}

enum City: String, Codable {
    case helsinki = "Helsinki"
}

enum Currency: String, Codable {
    case eur = "EUR"
}
