//
//  ViewController.swift
//  Circle
//
//  Created by Roman Levinzon on 08/11/2018.
//  Copyright © 2018 Roman Levinzon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CircleChangeListener{
    
    let viewModel = ViewModel()
    
    @IBOutlet weak var currentSizeLabel: UILabel! {
        didSet {
           currentSizeLabel.text = viewModel.circle.size.description
        }
    }
    
    @IBOutlet weak var circleViewContainer: UIView!
    
    @IBOutlet weak var stepper: UIStepper! {
        didSet { stepper.value = Double(viewModel.circle.size)}
    }
    
    @IBOutlet weak var greenSlider: UISlider! {
        didSet {greenSlider.value = Float(viewModel.circle.color.green) }
    }
    @IBOutlet weak var redSlider: UISlider! {
        didSet {redSlider.value = Float(viewModel.circle.color.red)}
    }
    @IBOutlet weak var blueSlider: UISlider! {
        didSet {blueSlider.value = Float(viewModel.circle.color.blue)}
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.attach(self)
        print("View did load set")

    }
    
    func onCircleChanged(_ circle: Circle) {
        currentSizeLabel.text = circle.size.description
        print(circle)
    }
    
    @IBAction func onStepperValueChanged(_ sender: UIStepper) {
        viewModel.setNewCircleSize(size: Int(sender.value))
    }
    
    @IBAction func onSwitchValueChanged(_ sender: UISwitch) {
        
    }

    @IBAction func onRedSliderValueChanged(_ sender: UISlider) {
        viewModel.setNewColorValues(Int(sender.value), nil, nil)
    }
    
    @IBAction func onGreenSliderValueChanged(_ sender: UISlider) {
        viewModel.setNewColorValues(nil, Int(sender.value), nil)

    }
    @IBAction func onBlueSliderValueChanged(_ sender: UISlider) {
        viewModel.setNewColorValues(nil, nil, Int(sender.value))
    }
    override func viewDidDisappear(_ animated: Bool) {
        viewModel.detach()
    }
}

