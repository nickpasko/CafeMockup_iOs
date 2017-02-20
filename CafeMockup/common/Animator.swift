import UIKit

class Animator {
    static func fadeIn(view: UIView, callback: @escaping () -> Swift.Void) {
        view.alpha = 0
        view.center.y -= 50;
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear,
           animations: {
            view.alpha = 1;
            view.center.y += 50;
           },
           completion: {
            finished in callback()
           }
        )
    }
    
    static func fadeOut(view: UIView, callback: @escaping () -> Swift.Void) {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear,
           animations: {
            view.alpha = 0;
            view.center.y -= 50;
           },
           completion: {
            finished in callback()
           }
        )
    }
    
    static func moveTo(view: UIView, x: CGFloat, y: CGFloat, callback: @escaping () -> Swift.Void) {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear,
           animations: {
            view.center.x = x
            view.center.y = y
           },
           completion: {
            finished in callback()
           }
        )
    }
    
    
    static func shake(view: UIView, duration: Float, callback: @escaping () -> Swift.Void) {
        let relativeDuration = 0.5
        UIView.animateKeyframes(withDuration: TimeInterval(duration), delay: 0, options: .calculationModeCubic, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: relativeDuration, animations: {
                view.center.x += 15
            })
            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: relativeDuration, animations: {
                view.center.x -= 30
            })
            UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: relativeDuration, animations: {
                view.center.x += 30
            })
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: relativeDuration, animations: {
                view.center.x -= 30
            })
            UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: relativeDuration, animations: {
                view.center.x += 15
            })
        },
        completion: {
            finished in callback()
        })
    }
}
