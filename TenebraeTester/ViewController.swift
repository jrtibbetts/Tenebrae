//  Copyright © 2016 nrith. All rights reserved.

import Tenebrae
import UIKit

class ViewController: UIViewController {

    var buttonLayers = [UIButton : EdgeShadowLayer]()
    
    @IBOutlet weak var targetView: UIView!
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    @IBAction func toggleShadow(button: UIButton) {
        button.selected = (button.selected ? false : true)
        
        if let layer = buttonLayers[button] {
            if button.selected {
                targetView?.layer.addSublayer(layer)
            } else {
                layer.removeFromSuperlayer()
            }
            
            targetView?.setNeedsDisplay()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonLayers[topButton]     = EdgeShadowLayer(forView: targetView, edge: .Top)
        buttonLayers[bottomButton]  = EdgeShadowLayer(forView: targetView, edge: .Bottom)
        buttonLayers[leftButton]    = EdgeShadowLayer(forView: targetView, edge: .Left)
        buttonLayers[rightButton]   = EdgeShadowLayer(forView: targetView, edge: .Right)
    }


}

