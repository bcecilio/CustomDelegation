//
//  SettingsController.swift
//  CustomDelegation
//
//  Created by Brendon Cecilio on 1/27/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import UIKit

protocol TableViewDelegate: AnyObject {
    func fontdidChange(fontSize: CGFloat)
}

class SettingsController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var fontSizeLabel: UILabel!
    @IBOutlet weak var fontSlider: UISlider!
    @IBOutlet weak var fontStepper: UIStepper!
    
    var fontSize: CGFloat? = 17 {
        didSet {
            delegate?.fontdidChange(fontSize: fontSize!)
            self.fontSizeLabel.text = "Font Size: \(String(format: "%0.f", fontSize!))"
            fontSlider.value = Float(fontSize!)
            fontStepper.value = Double(fontSize!)
        }
    }
    
    weak var delegate: TableViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fontSizeLabel.text = "Font Size: 17"
        configureSlider()
        configureStepper()
        fontSlider.value = Float(CGFloat(fontSize!))
        fontStepper.value = Double(CGFloat(fontSize!))
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
        fontSize = CGFloat(sender.value)
    }
    
    @IBAction func stepperSteppedOn(_ sender: UIStepper) {
        fontSize = CGFloat(sender.value)
    }
}
