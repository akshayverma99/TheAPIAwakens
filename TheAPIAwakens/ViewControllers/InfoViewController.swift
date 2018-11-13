//
//  InfoViewController.swift
//  TheAPIAwakens
//
//  Created by Akshay Verma on 2018-11-02.
//  Copyright © 2018 Akshay Verma. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    var screenType = selection.characters
    
    // Are given values as soon as the scene is loaded
    var currentStarship: Starship!
    var currentVehicle: Vehicle!
    var currentPerson: Person!
    
    @IBOutlet weak var USDButton: UIButton!
    @IBOutlet weak var CreditsButton: UIButton!
    
    @IBOutlet weak var EnglishButton: UIButton!
    @IBOutlet weak var MetricButton: UIButton!
    
    @IBOutlet weak var ConversionButton: UIButton!
    
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
        
        
        NetworkingManager(databaseType: screenType).sendNetworkingRequest(completionHandler: completionHandler)
        
        CreditsButton.isEnabled = false
        USDButton.isEnabled = true
        
        EnglishButton.isEnabled = true
        MetricButton.isEnabled = false

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
            hideCurrencyButtons()
        }else{
            heading1.text = "Make"
            heading2.text = "Cost"
            heading3.text = "Length"
            heading4.text = "Class"
            heading5.text = "Crew"
            showCurrencyButtons()
        }
    }
    
    func updateLabels(with vehicle: Starship ){
        nameTitle.text = vehicle.name
        infoLabel1.text = vehicle.manufacturer
        infoLabel2.text = vehicle.costInCredits
        infoLabel3.text = vehicle.length
        infoLabel4.text = vehicle.starshipClass
        infoLabel5.text = vehicle.crew
    }
    
    func updateLabels(with vehicle: Vehicle ){
        nameTitle.text = vehicle.name
        infoLabel1.text = vehicle.manufacturer
        infoLabel2.text = vehicle.costInCredits
        infoLabel3.text = vehicle.length
        infoLabel4.text = vehicle.vehicleClass
        infoLabel5.text = vehicle.crew
    }

    
    func updateLabels(with person: Person){
        nameTitle.text = person.name
        infoLabel1.text = person.birthYear
        infoLabel2.text = person.homeworld
        infoLabel3.text = person.height
        infoLabel4.text = person.eyeColor
        infoLabel5.text = person.hairColor
    }
    
    
    //  MARK: - Picker Functions
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        CreditsButton.isEnabled = false
        USDButton.isEnabled = true
        setLabels(for: row)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch screenType {
        case .characters: return DataStorage.characterStorage.results.count
        case .starships: return DataStorage.starshipStorage.results.count
        case .vehicles: return DataStorage.vehicleStorage.results.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch screenType {
        case .characters: return DataStorage.characterStorage.results[row].name
        case .starships: return DataStorage.starshipStorage.results[row].name
        case .vehicles: return DataStorage.vehicleStorage.results[row].name
        }
    }
    
    // MARK: Networking Functions
    
    
    func completionHandler(error: Error?, starWarsInfo: starwarsInfo?){
        if let error = error as? NetworkingErrors{
            switch error{
                
            // FIXME: Add modal popup returning to homescreen for each of these displaying the error
            case .failedNetworkingCall: presentPopUpError(message: "No Internet Connection")
            case .invalidURL: presentPopUpError(message: "Invalid URL Error")
            case .noData: presentPopUpError(message: "No Data")
            }
            
        }
        
        if let placeHolder = starWarsInfo{
            switch placeHolder.typeOfInfo{
            case .characters:
                if let placeHolder = placeHolder.data as? [Person]{
                    DataStorage.characterStorage.results = placeHolder
                }else{
                    
                }
            case .starships:
                if let placeHolder = placeHolder.data as? [Starship]{
                    DataStorage.starshipStorage.results = placeHolder
                }else{
                    
                }
            case .vehicles:
                if let placeHolder = placeHolder.data as? [Vehicle]{
                    DataStorage.vehicleStorage.results = placeHolder
                }else{
                    
                }
            }
        }
        
        DispatchQueue.main.async {
            self.setLabels(for: 0)
            self.picker.reloadAllComponents()
        }
    }
    
    // MARK: Label setting functions
    
    func setLabels(for index: Int){
        switch screenType{
        case .characters:
            updateLabels(with: DataStorage.characterStorage.results[index])
            currentPerson = DataStorage.characterStorage.results[index]
            hideConversionButton()
            
            guard let smallest = DataStorage.characterStorage.smallest else { return }
            guard let largest = DataStorage.characterStorage.largest else { return }
            
            smallestLabel.text = smallest.name
            largestLabel.text = largest.name
            
        case .starships:
            updateLabels(with: DataStorage.starshipStorage.results[index])
            currentStarship = DataStorage.starshipStorage.results[index]
            showConversionButton()
            
            guard let smallest = DataStorage.starshipStorage.smallest else { return }
            guard let largest = DataStorage.starshipStorage.largest else { return }
            
            smallestLabel.text = smallest.name
            largestLabel.text = largest.name
            
        case .vehicles:
            updateLabels(with: DataStorage.vehicleStorage.results[index])
            currentVehicle = DataStorage.vehicleStorage.results[index]
            showConversionButton()
            
            guard let smallest = DataStorage.vehicleStorage.smallest else { return }
            guard let largest = DataStorage.vehicleStorage.largest else { return }
            
            smallestLabel.text = smallest.name
            largestLabel.text = largest.name
            
        }
    }
    
    func hideCurrencyButtons(){
        USDButton.isHidden = true
        CreditsButton.isHidden = true
    }
    
    func showCurrencyButtons(){
        USDButton.isHidden = false
        CreditsButton.isHidden = false
    }
    
    func hideConversionButton(){
        ConversionButton.isHidden = true
    }
    
    func showConversionButton(){
        ConversionButton.isHidden = false
    }
    
    // MARK: Button Presses
    
    @IBAction func usdPressed(_ sender: UIButton) {
        if screenType == .starships{
            infoLabel2.text = currentStarship.costInUSD
        }else if screenType == .vehicles{
            infoLabel2.text = currentVehicle.costInUSD
        }
        
        CreditsButton.isEnabled = true
        USDButton.isEnabled = false
    }
    
    @IBAction func creditsPressed(_ sender: UIButton) {
        if screenType == .starships{
            infoLabel2.text = currentStarship.costInCredits
        }else if screenType == .vehicles{
            infoLabel2.text = currentVehicle.costInCredits
        }
        
        CreditsButton.isEnabled = false
        USDButton.isEnabled = true
    }
    
    @IBAction func englishButtonPressed(_ sender: UIButton) {
        switch screenType{
        case .characters: infoLabel3.text = currentPerson.heightInInches
        case .starships: infoLabel3.text = currentStarship.lengthInInches
        case .vehicles: infoLabel3.text = currentVehicle.lengthInInches
        }
        
        EnglishButton.isEnabled = false
        MetricButton.isEnabled = true
        
    }
    @IBAction func metricButtonPressed(_ sender: UIButton) {
        switch screenType{
        case .characters: infoLabel3.text = currentPerson.height
        case .starships: infoLabel3.text = currentStarship.length
        case .vehicles: infoLabel3.text = currentVehicle.length
        }
        
        EnglishButton.isEnabled = true
        MetricButton.isEnabled = false
    }
    
    // Mark ModaL Pop ups
    
    func presentPopUpError(message: String){
        let popup = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default){ action in
            self.dismiss(animated: true, completion: nil)
        }
        
        popup.addAction(action)
        
        self.present(popup, animated: true, completion: nil)
        
    }
    
}
