//
//  NetworkingManager.swift
//  TheAPIAwakens
//
//  Created by Akshay Verma on 2018-11-08.
//  Copyright © 2018 Akshay Verma. All rights reserved.
//

import Foundation


// Gets the database for one particular database type
class NetworkingManager{
    
    private var databaseType: databaseType
    
    init(databaseType: databaseType) {
        self.databaseType = databaseType
    }
    
    func getDatabaseType() -> databaseType{
        return databaseType
    }
    
    func sendNetworkingRequest(completionHandler completion: @escaping (Error?,starwarsInfo?) -> Void){
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        
        func makeNetworkRequest(withURL url: URL){
            URLSession.shared.dataTask(with: url, completionHandler: getData).resume()
        }
        
        func getData(data: Data?,response: URLResponse?,errors: Error?){
            if let data = data{
                if databaseType == .characters{
                    do{
                        let placeHolder = try decoder.decode(arrayOfPeople.self, from: data)
                        var newArray: [Person] = []
                            for person in placeHolder.results{
                                if let url = URL(string: person.homeworld){
                                    URLSession.shared.dataTask(with: url){ data,response,error in
                                        guard let data = data else { completion(NetworkingErrors.invalidURL,nil); return }
                                        do{
                                            let tempPlanet = try decoder.decode(homeworld.self, from: data)
                                            var tempPerson = person
                                            tempPerson.homeworld = tempPlanet.name
                                            print(tempPlanet.name)
                                            newArray.append(tempPerson)

                                        }catch{
                                            completion(NetworkingErrors.invalidURL,nil)
                                        }
                                        
                                        completion(nil,starwarsInfo(typeOfInfo: .characters, data: newArray as [AnyObject]))
                                        
                                    }.resume()
                                }else{
                                    completion(NetworkingErrors.invalidURL,nil)
                                }
                            }
                        print(placeHolder.results)
                        completion(nil,starwarsInfo(typeOfInfo: .characters, data: placeHolder.results as [AnyObject]))
                        

                    }catch{
                        completion(NetworkingErrors.noData,nil)
                    }
                }else if databaseType == .starships{
                    do{
                        let placeHolder = try decoder.decode(arrayOfStarships.self, from: data)
                        completion(nil,starwarsInfo(typeOfInfo: .starships, data: placeHolder.results as [AnyObject]))
                    }catch{
                        completion(NetworkingErrors.noData,nil)
                    }
                }else if databaseType == .vehicles{
                    do{
                        let placeHolder = try decoder.decode(arrayOfVehicles.self, from: data)
                        completion(nil,starwarsInfo(typeOfInfo: .vehicles, data: placeHolder.results as [AnyObject]))
                    }catch{
                        completion(NetworkingErrors.noData,nil)
                    }
                }
            }else{
                completion(NetworkingErrors.failedNetworkingCall,nil)
            }
        
        }


        switch databaseType {
        case .characters:
            if let tempUrl = UrlCreator.characterURL{
                makeNetworkRequest(withURL: tempUrl)
            }else{
                completion(NetworkingErrors.invalidURL, nil)
            }
        case .starships:
            if let tempUrl = UrlCreator.starshipURL{
                makeNetworkRequest(withURL: tempUrl)
            }else{
                completion(NetworkingErrors.invalidURL, nil)
            }
        case .vehicles:
            if let tempUrl = UrlCreator.vehicleURL{
                makeNetworkRequest(withURL: tempUrl)
            }else{
                completion(NetworkingErrors.invalidURL, nil)
            }
        }
        
        
    }
    
    
    
}
