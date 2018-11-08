//
//  UrlCreator.swift
//  TheAPIAwakens
//
//  Created by Akshay Verma on 2018-11-08.
//  Copyright © 2018 Akshay Verma. All rights reserved.
//

import Foundation

class UrlCreator{
    private static let baseURL = "https://swapi.co/api/"
    private static let characterEnding = "people"
    private static let starshipEnding = "starships"
    private static let vehicleEnding = "vehicles"
    
    static var characterURL: URL?{
        let placeHolder = baseURL + characterEnding
        return URL(string: placeHolder)
    }
    
    static  var starshipURL: URL?{
        let placeHolder = baseURL + starshipEnding
        return URL(string: placeHolder)
    }
    
    static var vehicleURL: URL?{
        let placeHolder = baseURL + vehicleEnding
        return URL(string: placeHolder)
    }
}
