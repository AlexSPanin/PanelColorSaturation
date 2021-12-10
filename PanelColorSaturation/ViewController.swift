//
//  ViewController.swift
//  PanelColorSaturation
//
//  Created by Александр Панин on 10.12.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var panelColorView: UIView!
    @IBOutlet var nameColorRed: UILabel!
    @IBOutlet var nameColorGreen: UILabel!
    @IBOutlet var nameColorBlue: UILabel!
    @IBOutlet var numberRedLabel: UILabel!
    @IBOutlet var numberGreenLabel: UILabel!
    @IBOutlet var numberBlueLabel: UILabel!
    @IBOutlet var colorRedSlider: UISlider!
    @IBOutlet var colorGreenSlider: UISlider!
    @IBOutlet var colorBlueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .darkGray
        
        nameColorRed.textColor = .white
        nameColorGreen.textColor = .white
        nameColorBlue.textColor = .white
        
        numberRedLabel.textColor = .white
        numberGreenLabel.textColor = .white
        numberBlueLabel.textColor = .white
        
        
        colorRedSlider.minimumTrackTintColor = .red
        colorGreenSlider.minimumTrackTintColor = .green
        colorBlueSlider.minimumTrackTintColor = .blue
        
        colorRedSlider.minimumValue = 0.0
        colorGreenSlider.minimumValue = 0.0
        colorBlueSlider.minimumValue = 0.0
        
        colorRedSlider.maximumValue = 1.0
        colorGreenSlider.maximumValue = 1.0
        colorBlueSlider.maximumValue = 1.0
        
        colorRedSlider.value = 0.5
        colorGreenSlider.value = 0.5
        colorBlueSlider.value = 0.5
        
        nameColorRed.text = "Red"
        nameColorGreen.text = "Green"
        nameColorBlue.text = "Blue"
        
        numberRedLabel.text = String(colorRedSlider.value)
        numberGreenLabel.text = String(colorGreenSlider.value)
        numberBlueLabel.text = String(colorBlueSlider.value)
    }
    
    override func viewWillLayoutSubviews() {
        panelColorView.layer.cornerRadius = panelColorView.frame.width / 10
    }

    @IBAction func colorRedSliderAction(_ sender: Any) {
        numberRedLabel.text = String(colorRedSlider.value)
        let colorRed = CGFloat(colorRedSlider.value)
        let colorGreen = CGFloat(colorGreenSlider.value)
        let colorBlue = CGFloat(colorBlueSlider.value)
        let colorAlfa = CGFloat(1.0)
        panelColorView.backgroundColor = UIColor(red: colorRed, green: colorGreen, blue: colorBlue, alpha: colorAlfa)
    }
    
    @IBAction func colorGreenSliderAction(_ sender: Any) {
        numberGreenLabel.text = String(colorGreenSlider.value)
        let colorRed = CGFloat(colorRedSlider.value)
        let colorGreen = CGFloat(colorGreenSlider.value)
        let colorBlue = CGFloat(colorBlueSlider.value)
        let colorAlfa = CGFloat(1.0)
        panelColorView.backgroundColor = UIColor(red: colorRed, green: colorGreen, blue: colorBlue, alpha: colorAlfa)
    }
    
    @IBAction func colorBlueAction(_ sender: Any) {
        numberBlueLabel.text = String(colorBlueSlider.value)
        let colorRed = CGFloat(colorRedSlider.value)
        let colorGreen = CGFloat(colorGreenSlider.value)
        let colorBlue = CGFloat(colorBlueSlider.value)
        let colorAlfa = CGFloat(1.0)
        panelColorView.backgroundColor = UIColor(red: colorRed, green: colorGreen, blue: colorBlue, alpha: colorAlfa)
    }
}

