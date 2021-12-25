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
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    var rgbColor: ColorRGB!
    var delegate: SettingViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        panelColorView.layer.cornerRadius = 15
        
        addDoneTextFields(for: redTextField, greenTextField, blueTextField)
        
        setValueSlider(for: rgbColor)
        printValueSlider(for: colorRedSlider, colorGreenSlider, colorBlueSlider)
    }
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        printValueSlider(for: sender)
    }
    
    @IBAction func doneButton(_ sender: UIButton) {
        view.endEditing(true)
        dismiss(animated: true)
        delegate.setValueColorBackground(for: rgbColor)
    }
}

// MARK - private func
extension SettingViewController {
    
    // MARK - func get value slider format string %.2f - 0.00
    private func stringValue(for slider: UISlider)  -> String {
        String(format: "%.2f" ,slider.value)
    }
    
    // MARK - func setting value slider
    private func setValueSlider(for value: ColorRGB) {
        colorRedSlider.setValue(value.red, animated: true)
        colorGreenSlider.setValue(value.green, animated: true)
        colorBlueSlider.setValue(value.blue, animated: true)
    }
    
    // MARK - func print and setting value sliders for textFields,labels and var (red, green, blue)
    private func printValueSlider(for sliders: UISlider...) {
        
        sliders.forEach { slider in
            switch slider {
            case colorRedSlider:
                redLabel.text = stringValue(for: slider)
                redTextField.text = stringValue(for: slider)
                rgbColor.red = slider.value
            case colorGreenSlider:
                greenLabel.text = stringValue(for: slider)
                greenTextField.text = stringValue(for: slider)
                rgbColor.green = slider.value
            default:
                blueLabel.text = stringValue(for: slider)
                blueTextField.text = stringValue(for: slider)
                rgbColor.blue = slider.value
            }
            drawColor()
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
    
    // MARK - Alert controller
    private func showAlert(title: String, message: String, field: UITextField) {
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) {_ in field.text = ""}
        
        alertView.addAction(okAction)
        self.present(alertView, animated: true)
    }
}

// MARK - private func UITextFieldDelegate
extension SettingViewController: UITextFieldDelegate {
    
    // MARK - func touchesBegan
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK - func textFieldShouldReturn
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case redTextField:
            greenTextField.becomeFirstResponder()
        case greenTextField:
            blueTextField.becomeFirstResponder()
        default:
            blueTextField.resignFirstResponder()
        }
        return true
    }
    
    // MARK - func textFieldDidEndEditing
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        guard let value = Float(newValue) else {
            showAlert(title: "Attention!!!", message: "Enter a Number: from 0.00 to 1.00", field: textField)
            return
        }
        if value >= 0 && value <= 1 {
            switch textField {
            case redTextField:
                colorRedSlider.setValue(value, animated: true)
            case greenTextField:
                colorGreenSlider.setValue(value, animated: true)
            default:
                colorBlueSlider.setValue(value, animated: true)
            }
        } else {
            showAlert(title: "Attention!!!",
                      message: "Enter a Number: from 0.00 to 1.00",
                      field: textField)
        }
        
        printValueSlider(for: colorRedSlider, colorGreenSlider, colorBlueSlider)
    }
    
    // MARK - add DONE for TexFields
    func addDoneTextFields(for textFields: UITextField...) {
        textFields.forEach { textField in
            textField.addDoneButtonOnKeyBoardWithControl()
        }
    }
}

// MARK - keyboad add DONE and Action resignFirstResponder
extension UITextField {
    
    func addDoneButtonOnKeyBoardWithControl() {
        let keyboardToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44))
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.resignFirstResponder))
        
        keyboardToolbar.items = [flexBarButton, doneBarButton]
        keyboardToolbar.sizeToFit()
        keyboardToolbar.barStyle = .default
        
        self.inputAccessoryView = keyboardToolbar
    }
}
