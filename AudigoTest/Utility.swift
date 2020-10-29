//
//  Utility.swift
//  AudigoTest
//
//  Created by Zaruhi Davtyan on 10/29/20.
//

import UIKit

func randomColor() -> UIColor {
    UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
}

func randomPosition(in frame: CGRect) -> CGPoint {
    CGPoint(x: frame.minX +  CGFloat(arc4random_uniform(UInt32(frame.width))), y: frame.minY +  CGFloat(arc4random_uniform(UInt32(frame.height))))
}

func randomSize(in rangeMaxBound: CGFloat) -> CGFloat {
    CGFloat.random(in: 0...rangeMaxBound)
}

func drawingFrame(frame: CGRect, size: CGFloat) -> CGRect {
    return CGRect(x: frame.minX + size, y: frame.minY + size, width: frame.width - 2 * size, height: frame.height - 2 * size)
}
