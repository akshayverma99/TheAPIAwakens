//
//  DataStructures.swift
//  TheAPIAwakens
//
//  Created by Akshay Verma on 2018-11-03.
//  Copyright © 2018 Akshay Verma. All rights reserved.
//

import Foundation

// JSON Objects

// MARK: Person

struct Person: Codable{
    let name: String
    let birthYear: String
    
    // Height in Centimeters
    let height: String
    let eyeColor: String
    let hairColor: String
    
    // is a url
    var homeworld: String
    
    var heightInInches: String{
        if let height = Double(height){
            return "\(height/2.54)"
        }else{
            return "Error"
        }
    }
}

struct arrayOfPeople: Codable{
    var results: [Person]
    
    var largest: Person?{
        if results.count > 0{
            var currentLargestPerson = results[0]
            for result in results{
                if let currentPersonSize = Double(result.height), let currentLargestSize = Double(currentLargestPerson.height){
                    if currentPersonSize > currentLargestSize{
                        currentLargestPerson = result
                    }
                }
            }
            return currentLargestPerson
        }else{
            return nil
        }
        
    }
    
    var smallest: Person?{
        if results.count > 0{
            var currentSmallestPerson = results[0]
            for result in results{
                if let currentPersonSize = Double(result.height), let currentSmallestSize = Double(currentSmallestPerson.height){
                    if currentPersonSize < currentSmallestSize{
                        currentSmallestPerson = result
                    }
                }
            }
            return currentSmallestPerson
        }else{
            return nil
        }
    }
}

// MARK: Starship

struct Starship: Codable{
    let name: String
    let manufacturer: String
    let costInCredits: String
    
    // Length in Meters
    let length: String
    let starshipClass: String
    let crew: String
    
    var costInUSD: String{
        let usd: Double? = Double(costInCredits)
        if var usd = usd{
            usd = usd/DataStorage.creditWorth
            return "\(usd)"
        }else{
            return "Unknown"
        }
    }
    
    var lengthInInches: String{
        if let length = Double(length){
            return "\(length*39.37)"
        }else{
            return "Error"
        }
    }
}

struct arrayOfStarships: Codable{
    var results: [Starship]
    
    var largest: Starship?{
        
        if results.count > 0{
            var currentLargestShip = results[0]
            for result in results{
                if let currentShipSize = Double(result.length), let currentLargestSize = Double(currentLargestShip.length){
                    if currentShipSize > currentLargestSize{
                        currentLargestShip = result
                    }
                }
            }
            return currentLargestShip
        }else{
            return nil
        }
       
    }
    
    var smallest: Starship?{
        if results.count > 0{
            var currentSmallestShip = results[0]
            for result in results{
                if let currentShipSize = Double(result.length), let currentSmallestSize = Double(currentSmallestShip.length){
                    if currentShipSize < currentSmallestSize{
                       currentSmallestShip = result
                    }
                }
            }
            return currentSmallestShip
        }else{
            return nil
        }
    }
}

// MARK: Vehicle

struct Vehicle: Codable{
    let name: String
    let manufacturer: String
    let costInCredits: String

    // Length in Meters
    let length: String
    let vehicleClass: String
    let crew: String
    
    var costInUSD: String{
        let usd: Double? = Double(costInCredits)
        if var usd = usd{
            usd = usd/DataStorage.creditWorth
            return "\(usd)"
        }else{
            return "Unknown"
        }
    }
    
    var lengthInInches: String{
        if let length = Double(length){
            return "\(length*39.37)"
        }else{
            return "Error"
        }
    }
}

struct arrayOfVehicles: Codable {
    var results: [Vehicle]
    
    var largest: Vehicle?{
        
        if results.count > 0{
            var currentLargestVehicle = results[0]
            for result in results{
                if let currentVehicleSize = Double(result.length), let currentLargestSize = Double(currentLargestVehicle.length){
                    if currentVehicleSize > currentLargestSize{
                        currentLargestVehicle = result
                    }
                }
            }
            return currentLargestVehicle
        }else{
            return nil
        }
        
    }
    
    var smallest: Vehicle?{
        if results.count > 0{
            var currentSmallestVehicle = results[0]
            for result in results{
                if let currentVehicleSize = Double(result.length), let currentSmallestSize = Double(currentSmallestVehicle.length){
                    if currentVehicleSize < currentSmallestSize{
                        currentSmallestVehicle = result
                    }
                }
            }
            return currentSmallestVehicle
        }else{
            return nil
        }
    }
}

// Mark: StarwarsInfo
struct starwarsInfo{
    let typeOfInfo: databaseType
    let data: [AnyObject]
}

// Mark: HomeWorld
struct homeworld: Codable{
    let name: String
}


