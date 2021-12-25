//
//  StertViewController.swift
//  PanelColorSaturation
//
//  Created by Александр Панин on 24.12.2021.
//

import UIKit

protocol SettingViewControllerDelegate {
    func setValueColorBackground(red: Float, green: Float, blue: Float)
}

class StartViewController: UIViewController {
    
    var redColor: Float = 1
    var greenColor: Float = 1
    var blueColor: Float = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
 //       setColorBackground()
        
    }
    // MARK: - Segue navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingVC = segue.destination as? SettingViewController else { return }
        settingVC.red = redColor
        settingVC.green = greenColor
        settingVC.blue = blueColor
        settingVC.delegate = self
    }
   
}
extension StartViewController {
    
    private func setColorBackground() {
        view.backgroundColor = UIColor(
            red: CGFloat(redColor),
            green: CGFloat(greenColor),
            blue: CGFloat(blueColor),
            alpha: 1.0)
    }
}

extension StartViewController: SettingViewControllerDelegate {
    func setValueColorBackground(red: Float, green: Float, blue: Float) {
        redColor = red
        greenColor = green
        blueColor = blue
        setColorBackground()
    }
    
}
