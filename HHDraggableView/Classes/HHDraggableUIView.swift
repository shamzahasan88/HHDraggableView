import UIKit

@IBDesignable
public class HHDraggableUIView: UIView {
    
    enum PostDragBehavior: Int {
        case none = 0
        case applyInertia = 1
        case snapToSides = 2
        case both = 3
    }
    
    private var initialTouchPoint: CGPoint = .zero
    private var initialCenter: CGPoint = .zero
    private var animator: UIDynamicAnimator?
    
    @IBInspectable var isDraggable: Bool = true
    @IBInspectable var applyInertia: Bool = true
    @IBInspectable var inertiaDuration: CGFloat = 1.5
    @IBInspectable var keepInScreen: Bool = true
    @IBInspectable var friction: CGFloat = 2.0
    @IBInspectable var snapToSides: Bool = false

    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupDraggableBehavior()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        setupDraggableBehavior()
    }
    
    private func setupDraggableBehavior() {
        if isDraggable {
            let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
            self.addGestureRecognizer(panGestureRecognizer)
        }
    }

    @objc private func handlePan(_ recognizer: UIPanGestureRecognizer) {
        guard let superview = self.superview, isDraggable else { return }

        let location = recognizer.location(in: superview)
        let velocity = recognizer.velocity(in: superview)

        switch recognizer.state {
        case .began:
            initialTouchPoint = location
            initialCenter = self.center

        case .changed:
            let translation = recognizer.translation(in: superview)
            updateCenter(with: translation, in: superview)

        case .ended:
            if applyInertia {
                addInertia(with: velocity)
            }
            if snapToSides {
                snapViewToSides(in: superview, velocity: velocity)
            }

        default:
            break
        }
    }

    private func updateCenter(with translation: CGPoint, in superview: UIView) {
        var newCenter = CGPoint(x: initialCenter.x + translation.x, y: initialCenter.y + translation.y)
        if keepInScreen {
            newCenter.x = max(min(newCenter.x, superview.bounds.maxX - self.bounds.width / 2), superview.bounds.minX + self.bounds.width / 2)
            newCenter.y = max(min(newCenter.y, superview.bounds.maxY - self.bounds.height / 2), superview.bounds.minY + self.bounds.height / 2)
        }
        self.center = newCenter
    }
    
    private func snapViewToSides(in superview: UIView, velocity: CGPoint) {
        let leftDistance = self.center.x
        let rightDistance = superview.bounds.width - self.center.x

        var targetX: CGFloat = leftDistance < rightDistance ? superview.bounds.minX + self.bounds.width / 2 : superview.bounds.maxX - self.bounds.width / 2

        // Optional: Adjust for velocity to make snapping feel more dynamic
        if velocity.x > 500 {  // Swipe right
            targetX = superview.bounds.maxX - self.bounds.width / 2
        } else if velocity.x < -500 {  // Swipe left
            targetX = superview.bounds.minX + self.bounds.width / 2
        }

        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.center = CGPoint(x: targetX, y: self.center.y)
        }, completion: nil)
    }



    private func addInertia(with velocity: CGPoint) {
        let decelerationBehavior = UIDynamicItemBehavior(items: [self])
        decelerationBehavior.addLinearVelocity(velocity, for: self)
        decelerationBehavior.resistance = friction  // Use the inspectable friction value
        
        let collisionBehavior = UICollisionBehavior(items: [self])
        if keepInScreen {
            collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        }
        
        animator = UIDynamicAnimator(referenceView: superview!)
        animator?.addBehavior(decelerationBehavior)
        animator?.addBehavior(collisionBehavior)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(Int(inertiaDuration))) {
            self.animator?.removeAllBehaviors()
        }
    }
}
