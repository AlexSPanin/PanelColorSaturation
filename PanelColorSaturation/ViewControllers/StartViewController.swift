//
//  StertViewController.swift
//  PanelColorSaturation
//
//  Created by Александр Панин on 24.12.2021.
//

import UIKit

protocol SettingViewControllerDelegate {
    func setValueColorBackground(for color: ColorRGB)
}

class StartViewController: UIViewController {
    
    private var rgbColor = ColorRGB(red: 1, green: 1, blue: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setColorBackground()
    }
    
    // MARK: - Segue navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingVC = segue.destination as? SettingViewController else { return }
        settingVC.rgbColor = rgbColor
        settingVC.delegate = self
    }
    
}
extension StartViewController {
    
    private func setColorBackground() {
        view.backgroundColor = UIColor(
            red: CGFloat(rgbColor.red),
            green: CGFloat(rgbColor.green),
            blue: CGFloat(rgbColor.blue),
            alpha: 1.0)
    }
}

extension StartViewController: SettingViewControllerDelegate {
    
    func setValueColorBackground(for color: ColorRGB) {
        rgbColor = color
        setColorBackground()
    }
}
