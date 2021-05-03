//
//  MainItemBackgroundView.swift
//  TennisistApp
//
//  Created by Ekaterina Akulina on 01.05.2021.
//

import UIKit

class MainItemBackgroundView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        let radius = 23.0
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: radius, y: 0))
        bezierPath.addLine(to: CGPoint(x: bounds.width, y: 0))
        bezierPath.addLine(to: CGPoint(x: bounds.width, y: bounds.height))
        bezierPath.addLine(to: CGPoint(x: CGFloat(radius), y: bounds.height))
        bezierPath.addArc(
            withCenter: CGPoint(x: CGFloat(radius), y: bounds.height - CGFloat(radius)),
            radius: CGFloat(radius),
            startAngle: CGFloat(Double.pi / -2),
            endAngle: CGFloat(Double.pi),
            clockwise: true
        )
        bezierPath.addLine(to: CGPoint(x: 0, y: radius))
        bezierPath.addArc(
            withCenter: CGPoint(x: CGFloat(radius), y: CGFloat(radius)),
            radius: CGFloat(radius),
            startAngle: CGFloat(Double.pi),
            endAngle: CGFloat(Double.pi * 1 / 2),
            clockwise: true
        )
        
        let color = UIColor(red: 30/255.0, green: 30/255.0, blue: 38/255.0, alpha: 1)
        color.setFill()
        bezierPath.fill()
    }
}
