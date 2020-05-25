//
//  CustomButton.swift
//  ViewAnimationBlock
//
//  Created by Simran Singh Sandhu on 25/05/20.
//  Copyright © 2020 Simran Singh Sandhu. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        settingBtnLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        settingBtnLayout()
    }
    
    func settingBtnLayout() {
        layer.cornerRadius = 15
        layer.shadowColor = UIColor.black.cgColor
        backgroundColor = UIColor.systemBlue
        layer.borderWidth = 2
        layer.borderColor = UIColor.black.cgColor
    }
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.systemOrange : UIColor.systemBlue
            transform = isHighlighted ? CGAffineTransform.init(scaleX: 0.95, y:  0.95) : CGAffineTransform.init(scaleX: 1, y: 1)
        }
    }
    
}
