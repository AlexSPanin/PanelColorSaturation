//
//  ViewController.swift
//  PanelColorSaturation
//
//  Created by Александр Панин on 10.12.2021.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet var panelColorView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var colorRedSlider: UISlider!
    @IBOutlet var colorGreenSlider: UISlider!
    @IBOutlet var colorBlueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        panelColorView.layer.cornerRadius = 15
        drawColor()
        printValueLabel(for: redLabel, greenLabel, blueLabel)
    }
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        drawColor()
        
        switch sender {
        case colorRedSlider:
            printValueLabel(for: redLabel)
        case colorGreenSlider:
            printValueLabel(for: greenLabel)
        default:
            printValueLabel(for: blueLabel)
        }
    }
}
// MARK - private func
extension SettingViewController {
    
    // MARK - func get value slider format string %.2f - 0.00
    private func stringValue(for slider: UISlider)  -> String {
        String(format: "%.2f" ,slider.value)
    }
    
    // MARK - func print value sliders for labels red, gree, blue
    private func printValueLabel(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redLabel:
                label.text = stringValue(for: colorRedSlider)
            case greenLabel:
                label.text = stringValue(for: colorGreenSlider)
            default:
                label.text = stringValue(for: colorBlueSlider)
            }
        }
    }
    
    // MARK - func set color view panel
    private func drawColor () {
        panelColorView.backgroundColor = UIColor(
            red: CGFloat(colorRedSlider.value),
            green: CGFloat(colorGreenSlider.value),
            blue: CGFloat(colorBlueSlider.value),
            alpha: 1)
    }
    
    
}
