//
//  ViewController.swift
//  TouchesAndGesturesUIKit
//
//  Created by Ruslan Khusainov on 21.06.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greenView: UIView!
//    var offset: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panned))
        greenView.addGestureRecognizer(panGesture)
        panGesture.delegate = self
    }
    
    @objc func panned(_ gesture: UIPanGestureRecognizer) {
        print("panned")
        
        let translation = gesture.translation(in: greenView)
        
        greenView.frame.origin.x += translation.x
        greenView.frame.origin.y += translation.y
        
        gesture.setTranslation(.zero, in: greenView)
    }
    
    @IBAction func longPressed(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            greenView.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
        }
        if sender.state == .ended {
            greenView.transform = .identity
        }
    }
    /*
     override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        let touch = touches.first!
        if touch.view == greenView {
            let location = touch.location(in: greenView)
            offset = location
            print("Touched Green View")
            print(String(format: "%.1f", location.x) + ", " + String(format: "%.1f", location.y))
            return
        }
        offset = nil
        print("touches began")
        let location = touch.location(in: view)
        print(String(format: "%.1f", location.x) + ", " + String(format: "%.1f", location.y))
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        print("touches moved")
        let touch = touches.first!
        let location = touch.location(in: view)
        
        guard let offset = offset else { return }
        
        if touch.view == greenView {
            greenView.frame.origin.x = location.x - offset.x
            greenView.frame.origin.y = location.y - offset.y
        }
        print(String(format: "%.1f", location.x) + ", " + String(format: "%.1f", location.y))
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        print("touches ended")
        let touch = touches.first!
        let location = touch.location(in: view)
        print(String(format: "%.1f", location.x) + ", " + String(format: "%.1f", location.y))
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        print("touches cancelled")
    }
     */
    
    
}

extension ViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
