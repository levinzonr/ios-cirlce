//
//  ViewModel.swift
//  Circle
//
//  Created by Roman Levinzon on 10/11/2018.
//  Copyright © 2018 Roman Levinzon. All rights reserved.
//

import Foundation

class ViewModel {
    init() {
        print("View Modele Init")
    }
    let circle = Circle()

    private var listener: CircleChangeListener? = nil
    
    
    func attach(_ listener: CircleChangeListener) {
        self.listener = listener
        self.listener?.onCircleChanged(circle)
    }

    func detach() {
        self.listener = nil
    }
    

    func setNewColorValues(_ red: Int? = nil, _ green: Int? = nil,_  blue: Int? = nil) {
        if let redColor = red { circle.color.red = redColor }
        if let greenColor = green { circle.color.green = greenColor }
        if let blueColor = blue { circle.color.blue = blueColor }
        listener?.onCircleChanged(circle)
    }
    
    func setNewCircleSize(size: Int) {
        circle.size = size
        listener?.onCircleChanged(circle)
    }
    
   
    
}

protocol CircleChangeListener {
    func onCircleChanged(_ circle: Circle)
}
