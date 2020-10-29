//
//  Circle.swift
//  AudigoTest
//
//  Created by Zaruhi Davtyan on 10/29/20.
//

import UIKit

struct Circle {
    let color: UIColor
    let size: CGFloat
    private static let maxSize: CGFloat = 150
    static func random() -> Circle {
        return Circle(color: randomColor(), size: randomSize(in: maxSize))
    }
}
