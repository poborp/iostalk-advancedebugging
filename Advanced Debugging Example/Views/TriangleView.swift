//
//  TriangleView.swift
//  Advanced Debugging Example
//
//  Created by Jacobo Rodriguez on 20/08/18.
//  Copyright © 2018 Jacobo Rodriguez. All rights reserved.
//

import UIKit

class TriangleView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: frame.size.width, y: 0))
        path.addLine(to: CGPoint(x: 0, y: frame.size.height))
        path.addLine(to: CGPoint(x: frame.size.width, y: frame.size.height))
        path.close()
        path.stroke()
    }
}
