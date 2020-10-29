//
//  CircleView.swift
//  AudigoTest
//
//  Created by Zaruhi Davtyan on 10/29/20.
//

import UIKit

class CircleView: UIView {
    
    private var tapGesture : UITapGestureRecognizer!
    private var doubleTapGesture : UITapGestureRecognizer!
    
    
    var onTap: (() -> Void)?
    var onDoubleTap: (() -> Void)?
    
    init(size: CGFloat) {
        super.init(frame: CGRect(x: 0, y: 0, width: size, height: size))
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(onTapAction(_:)))
        doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(onDoubleTapAction(_:)))
        doubleTapGesture.numberOfTapsRequired = 2
        tapGesture.require(toFail: doubleTapGesture)
        addGestureRecognizer(tapGesture)
        addGestureRecognizer(doubleTapGesture)
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.width / 2
    }
    
    @objc
    private func onTapAction(_ gesture: UITapGestureRecognizer) {
        if tapGesture == gesture, gesture.state == .ended {
            onTap?()
        }
    }
    
    @objc
    private func onDoubleTapAction(_ gesture: UITapGestureRecognizer) {
        if doubleTapGesture == gesture, gesture.state == .ended {
            onDoubleTap?()
        }
    }
    
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        return pow(center.x - point.x, 2) + pow(center.y - point.y, 2) <= pow(bounds.width / 2, 2)
    }
    
}
