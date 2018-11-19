//
//  ViewController.swift
//  Circle
//
//  Created by Roman Levinzon on 08/11/2018.
//  Copyright © 2018 Roman Levinzon. All rights reserved.
//

import UIKit


class ViewController: UIViewController, CircleChangeListener{
    
    let presenter = MainPresenter()
    
    @IBOutlet weak var currentSizeLabel: UILabel! {
        didSet { currentSizeLabel.text = presenter.circle.size.description }
    }
    
    @IBOutlet weak var circleViewContainer: UIView! {
        didSet { onCircleChanged(presenter.circle)}
    }
    
    @IBOutlet weak var stepper: UIStepper! {
        didSet { stepper.value = Double(presenter.circle.size)}
    }
    
    @IBOutlet weak var greenSlider: UISlider! {
        didSet {greenSlider.value = Float(presenter.circle.color.green) }
    }
    @IBOutlet weak var redSlider: UISlider! {
        didSet {redSlider.value = Float(presenter.circle.color.red)}
    }
    @IBOutlet weak var blueSlider: UISlider! {
        didSet {blueSlider.value = Float(presenter.circle.color.blue)}
    }
    
    
    @IBOutlet weak var circleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attach(self)

        print("Bounds: \(circleViewContainer.frame)")
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(recognizer:)))
        self.circleView.addGestureRecognizer(gestureRecognizer)
        print("View did load set")

    }
    

    
    @objc func handlePanGesture(recognizer : UIPanGestureRecognizer) {
    
        if (presenter.dragEnabled) {
        
            let point = recognizer.location(in: circleViewContainer)
            let bounds = circleViewContainer.bounds
            var circle = circleView.frame
        
            var newX = min(point.x, bounds.size.width - circle.size.width)
            newX = max(newX, 0.0)
            var newY = min(point.y, bounds.size.height - circle.size.height)
            newY = max(newY, 0.0)
            circle.origin.x = newX
            circle.origin.y = newY
            circleView.frame = circle
        }
        
    
    }

    func onCircleChanged(_ circle: Circle) {
        var frame = self.circleView.frame
        frame.size = CGSize(width: circle.size, height: circle.size)
        circleView.frame = frame
        circleView.layer.cornerRadius = self.circleView.frame.size.width / 2
        circleView.clipsToBounds = true
        circleView.backgroundColor = circle.color.toUIColor()
    }
    
    @IBAction func onStepperValueChanged(_ sender: UIStepper) {
        presenter.setNewCircleSize(size: sender.value)
        currentSizeLabel.text = sender.value.description

    }
    
    @IBAction func onSwitchValueChanged(_ sender: UISwitch) {
            presenter.dragEnabled = sender.isOn
    }

    @IBAction func onRedSliderValueChanged(_ sender: UISlider) {
        presenter.setNewColorValues(sender.value, nil, nil)
    }
    
    @IBAction func onGreenSliderValueChanged(_ sender: UISlider) {
        presenter.setNewColorValues(nil, sender.value, nil)

    }
    @IBAction func onBlueSliderValueChanged(_ sender: UISlider) {
        presenter.setNewColorValues(nil, nil, sender.value)
    }
    override func viewDidDisappear(_ animated: Bool) {
        presenter.detach()
    }
}

