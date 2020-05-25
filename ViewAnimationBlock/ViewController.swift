//
//  ViewController.swift
//  ViewAnimationBlock
//
//  Created by Simran Singh Sandhu on 18/04/20.
//  Copyright © 2020 Simran Singh Sandhu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let animateBtn: CustomButton = {
        let btn = CustomButton()
        btn.setTitle("Animate Button", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    @IBOutlet weak var mainView: UIView!
    // Creating an Instance of Height Constraint of the View that we want to Animate.
    @IBOutlet weak var viewHeightConstraint: NSLayoutConstraint!
    
    var animateBtnCenterYConstraint: NSLayoutConstraint!
    
    var enable: Bool = false
    
    var value: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        // Setting Default Value of the Height Constraint.
        viewHeightConstraint.constant = 0
        
        // Setting TapGestures on MainView
        settingTouchGesture()
        
        // Adding Subviews to View.
        mainView.addSubview(animateBtn)
        settingUpConstraints()
        animateBtn.addTarget(self, action: #selector(animateBtnHandle), for: .touchUpInside)
    }
    
    private func settingTouchGesture() {
        // Creating gestures for and adding it on the MainView.
        let singleTapGesture = UITapGestureRecognizer(target: self, action: #selector(mainViewPressed))
        mainView.addGestureRecognizer(singleTapGesture)
    }

    // When MainView is Pressed
    @objc func mainViewPressed(sender: UITapGestureRecognizer) {
        // Change Enable Value
        enable = !enable
        
        if enable {
            // Change Value of Height Constraint.
            viewHeightConstraint.constant = 250
            animateView()
        } else {
            
            viewHeightConstraint.constant = 0
            animateView()
        }
    }
    
    private func animateView() {
        
        // Animate View Animation and Update the layout of the View.
        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 3, options: [.curveEaseOut], animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
        
    }
}

extension ViewController {
    
    private func settingUpConstraints() {
        animateBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        animateBtn.widthAnchor.constraint(equalToConstant: 200).isActive = true
        animateBtnCenterYConstraint =  animateBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150)
        
        animateBtnCenterYConstraint.isActive = true
        
        animateBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
    }
    
    @objc func animateBtnHandle() {
        
        value = !value
        
        if value {
            animateBtnCenterYConstraint.constant += 100
        } else {
            animateBtnCenterYConstraint.constant -= 100
        }
        
        animateView()
        
    }
    
}

