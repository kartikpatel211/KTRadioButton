//
//  RadioButton.swift
//  KTRadioButton
//
//  Created by Kartik Patel on 12/21/16.
//  Copyright © 2016 Kartik Patel. All rights reserved.
//

import UIKit

protocol RadioButtonDelegate {
    func button(button : RadioButton, didSelected: Bool) -> Void
}

class RadioButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var delegate : RadioButtonDelegate?
    
    
    var fillContentLayer = CAShapeLayer.init()
    let fillContentStrokeColorWhenSelected = UIColor.green.cgColor
    let fillContentFillColorWhenSelected = UIColor.green.cgColor
    let fillContentStrokeColorWhenNotSelected = UIColor.clear.cgColor
    let fillContentFillColorWhenNotSelected = UIColor.clear.cgColor
    
    override init(frame : CGRect){
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    func initialize(){
        let contentBtnWidth : CGFloat = 20.0    // height = width, size of round circle shown on control
        
        let outerBorderContentMargin : CGFloat = 1.0
        let outerBorderContentLineWidth : CGFloat = 2.0
        let outerBorderContentStrokeColor = UIColor.black.cgColor
        let outerBorderContentFillColor = UIColor.clear.cgColor
        
        let fillContentMargin : CGFloat = 2.0
        
        
        let originYForOuterBorder = (self.frame.size.height - contentBtnWidth)/CGFloat(2.0)
        
        let outerBorderWidth = contentBtnWidth - (outerBorderContentMargin * 2)
        let outerCornerRadius = contentBtnWidth - (outerBorderContentMargin * 2) / CGFloat(2.0)
        
        let fillContentOriginX = outerBorderContentMargin + outerBorderContentLineWidth + fillContentMargin
        let fillContentOriginY = originYForOuterBorder + outerBorderContentLineWidth + fillContentMargin
        let fillContentWidth = contentBtnWidth - ((outerBorderContentMargin + outerBorderContentLineWidth + fillContentMargin) * 2)
        let fillContenetCornerRadius = (contentBtnWidth - ((outerBorderContentMargin + outerBorderContentLineWidth + fillContentMargin) * 2))/CGFloat(2.0)
        
        let outerContentPath = UIBezierPath.init(roundedRect: CGRect.init(x: outerBorderContentMargin, y:originYForOuterBorder, width: outerBorderWidth, height: outerBorderWidth), cornerRadius: outerCornerRadius)
        let outerContentLayer = CAShapeLayer.init()
        outerContentLayer.path = outerContentPath.cgPath
        outerContentLayer.lineWidth = outerBorderContentLineWidth
        outerContentLayer.fillColor = outerBorderContentFillColor
        outerContentLayer.strokeColor = outerBorderContentStrokeColor
        self.layer.addSublayer(outerContentLayer)
        
        let fillContentPath = UIBezierPath.init(roundedRect: CGRect.init(x: fillContentOriginX, y: fillContentOriginY, width: fillContentWidth, height: fillContentWidth), cornerRadius: fillContenetCornerRadius)
        fillContentLayer.path = fillContentPath.cgPath
        fillContentLayer.lineWidth = outerBorderContentLineWidth
        fillContentLayer.fillColor = fillContentFillColorWhenNotSelected
        fillContentLayer.strokeColor = fillContentStrokeColorWhenNotSelected
        self.layer.addSublayer(fillContentLayer)
        
        self.titleEdgeInsets = UIEdgeInsetsMake(0, contentBtnWidth + 5, 0, 0)
        
        self.toogleState()
        
        self.addTarget(self, action: #selector(pressed), for: .touchUpInside)
    }
    
    func pressed(){
        self.isSelected = true // only selection can done through touch
    }
    
    override var isSelected: Bool {
        didSet {            
            toogleState()
        }
    }
    func toogleState() {
        if state.contains(.selected) {
            fillContentLayer.fillColor = fillContentFillColorWhenSelected
            fillContentLayer.strokeColor = fillContentStrokeColorWhenSelected
            delegate?.button(button: self, didSelected: true)
        } else {
            fillContentLayer.fillColor = fillContentFillColorWhenNotSelected
            fillContentLayer.strokeColor = fillContentStrokeColorWhenNotSelected
            // no need to call delegate method when state changed to false because false state changed only through code
        }
    }
}
