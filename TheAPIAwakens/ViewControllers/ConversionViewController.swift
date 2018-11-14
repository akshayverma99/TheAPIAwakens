//
//  ConversionViewController.swift
//  TheAPIAwakens
//
//  Created by Akshay Verma on 2018-11-13.
//  Copyright © 2018 Akshay Verma. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {
    
    @IBOutlet weak var ErrorLabel: UILabel!
    
    
    // Called everytime the number in the conversion box is changed
    // and saves it to be used in the calculations, also displays an
    // error if the user inputs 0, a negative number, or other characters
    @IBAction func conversionNumChanged(_ sender: UITextField) {
        guard let text = sender.text else { return }
        let conversionNum: Double? = Double(text)
        
        if let conversionNum = conversionNum, conversionNum > 0{
            ErrorLabel.isHidden = true
            DataStorage.creditWorth = conversionNum
        }else{
            ErrorLabel.isHidden = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Conversion Rate"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
