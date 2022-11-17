//
//  X-OButton.swift
//  O-Tic(Storyboard)
//
//  Created by admin on 16.11.2022.
//

import UIKit

@IBDesignable class XorOButton: UIButton
{

    // Allows developer to edit what colors are shown in each state
    @IBInspectable var borderColorSelected:UIColor = UIColor.purple
    @IBInspectable var borderColorDeselected:UIColor = UIColor.purple
    
    @IBInspectable var borderWidth:CGFloat = 3
    @IBInspectable var cornerRadius:CGFloat = 10
    
    // The color of text shown in each state
    @IBInspectable var textColorDeselected:UIColor = UIColor.lightGray
    @IBInspectable var textColorSelected:UIColor = UIColor.black
    
    // Sets the Active/Inactive State
    @IBInspectable var active:Bool = false
    
    // Custom Border to the UIButton
    private let border = CAShapeLayer()
    
    public var turn: String?

    override func draw(_ rect: CGRect) {
        
        // Setup CAShape Layer (Dashed/Solid Border)
        border.lineWidth = borderWidth
        border.frame = self.bounds
        border.fillColor = nil
        border.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius).cgPath
        self.layer.addSublayer(border)
        
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
        
        // Setup the Button Depending on What State it is in
        if active {
            setSelected()
        } else {
            setDeselected()
        }
        
        // Respond to touch events by user
        self.addTarget(self, action: #selector(onPress), for: .touchUpInside)
    }
    
    @objc func onPress() {
        print("Button Pressed")
        active = !active
        
        if active {
            setSelected()
        } else {
            setDeselected()
        }
    }
    
    // Set the selected properties
    func setSelected() {
        border.lineDashPattern = nil
        border.strokeColor = borderColorSelected.cgColor
        self.setTitle(turn, for: .normal)
        self.setTitleColor(textColorSelected, for: .normal)
    }
    
    // Set the deselcted properties
    func setDeselected() {
        border.lineDashPattern = [4, 4]
        border.strokeColor = borderColorDeselected.cgColor
        self.setTitle("", for: .normal)
        self.setTitleColor(textColorDeselected, for: .normal)
    }

}
