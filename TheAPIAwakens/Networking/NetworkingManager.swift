//
//  NetworkingManager.swift
//  TheAPIAwakens
//
//  Created by Akshay Verma on 2018-11-08.
//  Copyright © 2018 Akshay Verma. All rights reserved.
//

import Foundation


// Gets the database for one particular database type
class NetworkingManager: database{
    
    private var databaseType: databaseType
    
    init(databaseType: databaseType) {
        self.databaseType = databaseType
    }
    
    func getDatabaseType() -> databaseType{
        return databaseType
    }
    
    func sendNetworkingRequest() throws -> [AnyObject]{
        
    }
    
    
    
}
