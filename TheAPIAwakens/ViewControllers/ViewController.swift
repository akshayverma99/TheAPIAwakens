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
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

