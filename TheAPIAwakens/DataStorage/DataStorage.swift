//
//  DataStorage.swift
//  TheAPIAwakens
//
//  Created by Akshay Verma on 2018-11-10.
//  Copyright © 2018 Akshay Verma. All rights reserved.
//

import Foundation

struct DataStorage{
    static var vehicleStorage: arrayOfVehicles = arrayOfVehicles(results: [])
    static var characterStorage: arrayOfPeople = arrayOfPeople(results: [])
    static var starshipStorage: arrayOfStarships = arrayOfStarships(results: [])
    
    static var creditWorth: Double = 2
}
