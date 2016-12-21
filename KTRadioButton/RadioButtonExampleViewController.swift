//
//  RadioButtonExampleViewController.swift
//  KTRadioButton
//
//  Created by Kartik Patel on 12/21/16.
//  Copyright © 2016 Kartik Patel. All rights reserved.
//

import UIKit

class RadioButtonExampleViewController: UIViewController, RadioButtonGroupDeleagte {

    @IBOutlet weak var rbOption1: RadioButton!
    @IBOutlet weak var rbOption2: RadioButton!
    @IBOutlet weak var rbOption3: RadioButton!
    @IBOutlet weak var rbOption4: RadioButton!
    
    @IBOutlet weak var rbanotherOption1: RadioButton!
    @IBOutlet weak var rbanotherOption2: RadioButton!
    @IBOutlet weak var rbanotherOption3: RadioButton!
    
    var grpRadioBtn = RadioButtonGroup(groupID: 1, groupName: "Option Level")
    var grpRadioBtnTwo = RadioButtonGroup(groupID: 2, groupName: "Option Value")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        grpRadioBtn.addButton(button: rbOption1)
        grpRadioBtn.addButton(button: rbOption2)
        grpRadioBtn.addButton(button: rbOption3)
        grpRadioBtn.addButton(button: rbOption4)
        grpRadioBtn.groupDeleagte = self
        
        grpRadioBtnTwo.addButton(button: rbanotherOption1)
        grpRadioBtnTwo.addButton(button: rbanotherOption2)
        grpRadioBtnTwo.addButton(button: rbanotherOption3)
        grpRadioBtnTwo.groupDeleagte = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func group(group : RadioButtonGroup, optionSelected: RadioButton) {
        print("Option selected in group: \(group.groupID) - button: \(optionSelected.titleLabel?.text)")
    }
}
