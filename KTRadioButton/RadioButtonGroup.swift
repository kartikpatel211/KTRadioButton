//
//  RadioButtonGroup.swift
//  KTRadioButton
//
//  Created by Kartik Patel on 12/21/16.
//  Copyright © 2016 Kartik Patel. All rights reserved.
//

import UIKit

protocol RadioButtonGroupDeleagte {
    func group(group : RadioButtonGroup, optionSelected: RadioButton)
}

class RadioButtonGroup: NSObject, RadioButtonDelegate {
    
    var arrRadioButtons = [RadioButton]()
    var groupID : Int
    var groupName : String
    var groupDeleagte : RadioButtonGroupDeleagte?
    
    init(groupID: Int, groupName: String) {
        self.groupID = groupID
        self.groupName = groupName
    }
    
    func addButton(button: RadioButton){
        arrRadioButtons.append(button)
        button.delegate = self
    }
    
    func button(button : RadioButton, didSelected: Bool) -> Void {
        for btn in arrRadioButtons {
            if btn !== button {
                btn.isSelected = false
            }
        }
        groupDeleagte?.group(group: self, optionSelected: button)
    }
}
