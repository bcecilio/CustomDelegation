//
//  SettingsController.swift
//  CustomDelegation
//
//  Created by Brendon Cecilio on 1/27/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import UIKit

protocol TableViewDelegate: AnyObject {
    func fontdidChange(fonSize: CGFloat)
}

class SettingsController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var fontSlider: UISlider!
    @IBOutlet weak var fontStepper: UIStepper!
    
    var fontSize: CGFloat? = 17
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSlider()
        configureStepper()
    }
    
    func configureSlider() {
        fontSlider.minimumValue = 1
        fontSlider.maximumValue = 50
        fontSlider.value = 1
    }
    
    func configureStepper() {
        fontStepper.minimumValue = 1
        fontStepper.maximumValue = 50
        fontStepper.value = 1
    }
    
    @IBAction func sliderSlided(_ sender: UISlider) {
        
    }
    
    @IBAction func stepperSteppedOn(_ sender: UIStepper) {
        
    }
}

extension SettingsController: TableViewDelegate {
    
    func fontdidChange(fonSize: CGFloat) {
        <#code#>
    }
}
