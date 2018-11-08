//
//  InfoViewController.swift
//  TheAPIAwakens
//
//  Created by Akshay Verma on 2018-11-02.
//  Copyright © 2018 Akshay Verma. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    let data: [String] = [""]
    var screenType = selection.characters
    
    @IBOutlet weak var USDButton: UIButton!
    @IBOutlet weak var CreditsButton: UIButton!
    
    @IBOutlet weak var nameTitle: UILabel!
    
    @IBOutlet weak var heading1: UILabel!
    @IBOutlet weak var heading2: UILabel!
    @IBOutlet weak var heading3: UILabel!
    @IBOutlet weak var heading4: UILabel!
    @IBOutlet weak var heading5: UILabel!
    
    @IBOutlet weak var infoLabel1: UILabel!
    @IBOutlet weak var infoLabel2: UILabel!
    @IBOutlet weak var infoLabel3: UILabel!
    @IBOutlet weak var infoLabel4: UILabel!
    @IBOutlet weak var infoLabel5: UILabel!
    
    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var smallestLabel: UILabel!
    @IBOutlet weak var largestLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        picker.dataSource = self
        picker.delegate = self
        
        // Sets the title color to white
        let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        updateTitle()
        updateHeadings()
        
        nameTitle.text = data[0]
        
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
    
    // MARK: - Label Setup
    
    func updateTitle(){
        switch screenType{
        case .characters: title = "Characters"
        case .starships: title = "Starships"
        case .vehicles: title = "Vehicles"
        }
    }
    
    func updateHeadings(){
        if screenType == .characters{
            heading1.text = "Born"
            heading2.text = "Home"
            heading3.text = "Height"
            heading4.text = "Eyes"
            heading5.text = "Hair"
        }else{
            heading1.text = "Make"
            heading2.text = "Cost"
            heading3.text = "Length"
            heading4.text = "Class"
            heading5.text = "Crew"
        }
    }
    
    
    //  MARK: - Picker Functions
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        nameTitle.text = data[row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
    
}
