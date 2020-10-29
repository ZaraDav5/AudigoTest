//
//  ViewController.swift
//  AudigoTest
//
//  Created by Zaruhi Davtyan on 10/29/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var containerView: ContainerView!
    @IBOutlet weak var stepper: UIStepper!

    @IBAction func stepperAction(_ sender: UIStepper) {
        print(sender.value)
        let value = Int(sender.value)
        if value > currentValue {
            containerView.addCircleView(circle: Circle.random())
        } else {
            containerView.removeLastCircleView()
        }
        currentValue = value
        setTitle()
    }
    
    private var currentValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        currentValue = Int(stepper.value)
        setTitle()
        
        containerView.onCircleViewTap =  { (circleView) in
            print("circle view position", circleView.center, "size", circleView.frame.size)
        }
        
        containerView.onCircleViewDoubleTap =  {[weak self] (circleView) in
            self?.containerView.removeCircle(circleView)
        }
    }
    
    func setTitle() {
        title =  currentValue == 1 ? String(currentValue) + " Widget" : String(currentValue) + " Widgets"
    }
    
}

