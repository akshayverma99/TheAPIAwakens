//
//  DataStructures.swift
//  TheAPIAwakens
//
//  Created by Akshay Verma on 2018-11-03.
//  Copyright © 2018 Akshay Verma. All rights reserved.
//

import Foundation

enum selection{
    case characters
    case vehicles
    case starships 
}

// JSON Objects

struct person: Codable{
    let name: String
    let birthYear: String
    let height: String
    let eyeColor: String
    let hairColor: String
    
    // is a url
    let homeworld: String
}

struct Vehicle: Codable{
    let name: String
    let manufacturer: String
    let costInCredits: String
    let length: String
    let starshipClass: String
    let crew: String
}
