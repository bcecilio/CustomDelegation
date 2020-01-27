//
//  SettingsController.swift
//  CustomDelegation
//
//  Created by Brendon Cecilio on 1/27/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import UIKit

protocol TableViewDelegate: AnyObject {
    func fontdidChange(changeVC: SettingsController, fontSize: CGFloat)
}

class SettingsController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var fontSizeLabel: UILabel!
    @IBOutlet weak var fontSlider: UISlider!
    @IBOutlet weak var fontStepper: UIStepper!
    
    
    var fontSize: CGFloat = 17 {
        didSet {
            delegate?.fontdidChange(changeVC: self, fontSize: fontSize)
        }
    }
    
    weak var delegate: TableViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fontSizeLabel.text = "Font Size: \(String(format: "%0.f", fontSize))"
        configureSlider()
        configureStepper()
    }
    
    func configureSlider() {
        fontSlider.minimumValue = 1.0
        fontSlider.maximumValue = 50.0
        fontSlider.value = Float(fontSize)
    }
    
    func configureStepper() {
        fontStepper.minimumValue = 1.0
        fontStepper.maximumValue = 50.0
        fontStepper.value = Double(fontSize)
        fontStepper.stepValue = 1.0
    }
    
    @IBAction func sliderSlided(_ sender: UISlider) {
        fontSize = CGFloat(sender.value)
        fontStepper.value = Double(sender.value)
        fontSizeLabel.text = "Font Size: \(String(format: "%0.f", fontSize))"
    }
    
    @IBAction func stepperSteppedOn(_ sender: UIStepper) {
        fontSize = CGFloat(sender.value)
        fontSlider.value = Float(sender.value)
        fontSizeLabel.text = "Font Size: \(String(format: "%0.f", fontSize))"
    }
}
