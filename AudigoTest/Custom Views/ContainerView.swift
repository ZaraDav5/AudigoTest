//
//  ContainerView.swift
//  AudigoTest
//
//  Created by Zaruhi Davtyan on 10/29/20.
//

import UIKit

class ContainerView: UIView {

   private var circles = [CircleView]()
    
    var onCircleViewTap: ((CircleView) -> Void)?
    var onCircleViewDoubleTap: ((CircleView) -> Void)?

    func addCircleView(circle: Circle) {
        let circleView = CircleView(size: circle.size)
        circleView.backgroundColor = circle.color
        self.addSubview(circleView)
        circleView.center = randomPosition(in: drawingFrame(frame: bounds, size: circle.size))
        circles.append(circleView)
        
        circleView.onTap = {[weak self] in
            self?.blinkAnimation(circleView: circleView, completion: nil)
            self?.onCircleViewTap?(circleView)
        }
        
        circleView.onDoubleTap = {[weak self] in
            self?.onCircleViewDoubleTap?(circleView)
        }
        
        addAnimation(circleView: circleView, completion: nil)
        
        
    }
    
    func removeLastCircleView() {
        guard let circleView = circles.popLast() else { return }
        removeAnimation(circleView: circleView) {
            circleView.removeFromSuperview()
        }
    }
    
    func removeCircle(_ circleView: CircleView) {
        removeAnimation(circleView: circleView) {
            circleView.removeFromSuperview()
        }
        
        let index = circles.firstIndex { $0 == circleView }
        guard let _index = index else { return }
        circles.remove(at: _index)
    }
    
    private func addAnimation(circleView: CircleView, completion: (() -> Void)?) {
        circleView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(withDuration: 0.25) {
            circleView.transform = CGAffineTransform(scaleX: 1, y: 1)
        } completion: { _ in
            completion?()
        }
    }
    
    private func removeAnimation(circleView: CircleView, completion: (() -> Void)?) {
        UIView.animate(withDuration: 0.25) {
            circleView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        } completion: { _ in
            completion?()
        }
    }
    
    private func blinkAnimation(circleView: CircleView, completion: (() -> Void)?) {
        UIView.animate(withDuration: 0.25,
                       delay: 0.0,
                       options: [.curveEaseInOut, .autoreverse],
                       animations: {
                        circleView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                       },
                       completion: {_ in
                        circleView.transform = CGAffineTransform(scaleX: 1, y: 1)
                        completion?()
                       })
    }
}
