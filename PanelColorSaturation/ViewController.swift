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
    
    private let colorAlfa:CGFloat = 1.0
    private var colorRed:CGFloat = 0.0
    private var colorGreen:CGFloat = 0.0
    private var colorBlue:CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawColorPanel()
        
        colorRedSlider.minimumTrackTintColor = .red
        colorGreenSlider.minimumTrackTintColor = .green
        colorBlueSlider.minimumTrackTintColor = .blue
        
        nameColorRed.text = "Red"
        nameColorGreen.text = "Green"
        nameColorBlue.text = "Blue"
        
        numberRedLabel.text = String(colorRedSlider.value)
        numberGreenLabel.text = String(colorGreenSlider.value)
        numberBlueLabel.text = String(colorBlueSlider.value)
    }
    
    override func viewWillLayoutSubviews() {
        panelColorView.layer.cornerRadius = panelColorView.frame.width / 10
        drawColorPanel()
    }

    @IBAction func colorRedSliderAction(_ sender: Any) {
        numberRedLabel.text = String(round(colorRedSlider.value * 100) / 100)
        drawColorPanel()
    }
    
    @IBAction func colorGreenSliderAction(_ sender: Any) {
        numberGreenLabel.text = String(round(colorGreenSlider.value * 100) / 100)
        drawColorPanel()
    }
    
    @IBAction func colorBlueAction(_ sender: Any) {
        numberBlueLabel.text = String(round(colorBlueSlider.value * 100) / 100)
        drawColorPanel()
    }
    
    private func drawColorPanel () {
        colorRed = CGFloat(colorRedSlider.value)
        colorGreen = CGFloat(colorGreenSlider.value)
        colorBlue = CGFloat(colorBlueSlider.value)
        panelColorView.backgroundColor = UIColor(red: colorRed, green: colorGreen, blue: colorBlue, alpha: colorAlfa)
    }
}

