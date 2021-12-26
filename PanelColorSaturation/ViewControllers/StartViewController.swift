//
//  StertViewController.swift
//  PanelColorSaturation
//
//  Created by Александр Панин on 24.12.2021.
//

import UIKit

protocol SettingViewControllerDelegate {
    func setValueColorBackground(for color: UIColor)
}

class StartViewController: UIViewController {
    
    // MARK: - Segue navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingVC = segue.destination as? SettingViewController else { return }
        settingVC.rgbColor = view.backgroundColor
        settingVC.delegate = self
    }
    
}

extension StartViewController: SettingViewControllerDelegate {
    
    func setValueColorBackground(for color: UIColor) {
        view.backgroundColor = color
    }
}
