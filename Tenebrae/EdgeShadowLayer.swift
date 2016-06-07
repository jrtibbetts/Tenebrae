//  Copyright © 2016 nrith. All rights reserved.

import UIKit

/// A `CAGradientLayer` that can be attached to a `UIView` inside one of the
/// view's edges.
public class EdgeShadowLayer: CAGradientLayer {

    /// The possible attachment positions for the shadow.
    public enum Edge {
        case Top
        case Left
        case Bottom
        case Right
    }
    
    /// Create a shadow layer for a specified edge on a specified view.
    ///
    ///  - parameter forView: The `UIView`. The view's frame is used to set up
    ///    the layer's frame, but the layer itself is **not** attached to the
    ///    view in this initializer.
    ///  - parameter edge: The edge of the view that will get the shadow. The
    ///    default is Edge.Top.
    ///  - parameter shadowRadius: The width or depth of the shadow. The default
    ///    is 20.
    ///  - parameter toColor: The color to fade to (i.e. furthest from the
    ///    view's edge). The default is UIColor.whiteColor().
    ///  - parameter fromColor: The color to fade from (i.e. closest to the
    ///    view's edge). The default is UIColor.blackColor().
    public init(forView view: UIView,
                        edge: Edge = Edge.Top,
                        shadowRadius radius: CGFloat = 20.0,
                        toColor: UIColor = UIColor.whiteColor(),
                        fromColor: UIColor = UIColor.blackColor()) {
        super.init()
        self.colors = [fromColor.CGColor, toColor.CGColor]
        self.shadowRadius = radius
        
        // Set up its frame.
        let viewFrame = view.frame
        
        switch edge {
        case .Top:
            startPoint = CGPoint(x: 0.5, y: 0.0)
            endPoint = CGPoint(x: 0.5, y: 1.0)
            self.frame = CGRect(x: 0.0, y: 0.0, width: viewFrame.width, height: shadowRadius)
        case .Bottom:
            startPoint = CGPoint(x: 0.5, y: 1.0)
            endPoint = CGPoint(x: 0.5, y: 0.0)
            self.frame = CGRect(x: 0.0, y: viewFrame.height - shadowRadius, width: viewFrame.width, height: shadowRadius)
        case .Left:
            startPoint = CGPoint(x: 0.0, y: 0.5)
            endPoint = CGPoint(x: 1.0, y: 0.5)
            self.frame = CGRect(x: 0.0, y: 0.0, width: shadowRadius, height: viewFrame.height)
        case .Right:
            startPoint = CGPoint(x: 1.0, y: 0.5)
            endPoint = CGPoint(x: 0.0, y: 0.5)
            self.frame = CGRect(x: viewFrame.width - shadowRadius, y: 0.0, width: shadowRadius, height: viewFrame.height)
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
