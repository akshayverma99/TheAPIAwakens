//
//  ViewController.swift
//  TheAPIAwakens
//
//  Created by Akshay Verma on 2018-11-01.
//  Copyright © 2018 Akshay Verma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
            case 1,2,3: performSegue(withIdentifier: "shift", sender: nil)
            default: print("testicles")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let button = sender as? UIButton else {  return  }
        
        switch button.tag{
            case 1: print("")
            case 2: print("")
            case 3: print("")
        default: print("testicles")
        }
        
    }
    
}

