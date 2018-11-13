//
//  Enums.swift
//  TheAPIAwakens
//
//  Created by Akshay Verma on 2018-11-13.
//  Copyright © 2018 Akshay Verma. All rights reserved.
//

import Foundation

enum selection{
    case characters
    case vehicles
    case starships
}

typealias databaseType = selection

enum NetworkingErrors: Error{
    case noData
    case failedNetworkingCall
    case invalidURL
}
