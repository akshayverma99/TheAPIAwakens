//
//  ViewController.swift
//  TheAPIAwakens
//
//  Created by Akshay Verma on 2018-11-01.
//  Copyright © 2018 Akshay Verma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentSelection: selection?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NetworkingManager(databaseType: .characters).sendNetworkingRequest(completionHandler: completionHandler)
        NetworkingManager(databaseType: .starships).sendNetworkingRequest(completionHandler: completionHandler)
        NetworkingManager(databaseType: .vehicles).sendNetworkingRequest(completionHandler: completionHandler)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func completionHandler(error: Error?, starWarsInfo: starwarsInfo?){
        if let error = error as? NetworkingErrors{
            switch error{
                case .failedNetworkingCall: print("1")
                case .invalidURL: print("2")
                case .noData: print("3")
            }
            
        }
        
        if let placeHolder = starWarsInfo{
            switch placeHolder.typeOfInfo{
            case .characters:
                if let placeHolder = placeHolder.data as? [Person]{
                    DataStorage.characterStorage = placeHolder
                }else{
                    
                }
                
                for x in DataStorage.characterStorage{
                    print(x.name)
                }
                
            case .starships:
                if let placeHolder = placeHolder.data as? [Starship]{
                    DataStorage.starshipStorage = placeHolder
                }else{
                    
                }
                
                for x in DataStorage.starshipStorage{
                    print(x.name)
                }
                
            case .vehicles:
                if let placeHolder = placeHolder.data as? [Vehicle]{
                    DataStorage.vehicleStorage = placeHolder
                }else{
                    
                }
                
                for x in DataStorage.vehicleStorage{
                    print(x.name)
                }
                
            }
        }
    }
    
    @IBAction func segue(_ sender: UIButton) {
        switch sender.tag{
        case 1: currentSelection = .characters
        case 2: currentSelection = .vehicles
        case 3: currentSelection = .starships
        default: fatalError()
        }
        
        performSegue(withIdentifier: "shift", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selection = currentSelection else {  return  }
        guard let viewController = segue.destination as? InfoViewController else {   return  }
        
        viewController.screenType = selection
        
    }
    
}

