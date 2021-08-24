//
//  BiofourmisExtension.swift
//  BiofourmisAssignment
//
//  Created by kumar praveen on 20/08/21.
//

import Foundation
import UIKit


extension UIViewController{
    class func getViewControllerWith(storyBoardID : String , ViewControllerID : String) -> UIViewController{
        let storyboard = UIStoryboard(name: storyBoardID, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: ViewControllerID)
    }
}

@objc public extension UIViewController {

    private func swizzled_present(_ viewControllerToPresent: UIViewController, animated: Bool, completion: (() -> Void)?) {

        if #available(iOS 13.0, *) {
            if viewControllerToPresent.modalPresentationStyle == .automatic || viewControllerToPresent.modalPresentationStyle == .pageSheet {
                viewControllerToPresent.modalPresentationStyle = .fullScreen
            }
        }

        self.swizzled_present(viewControllerToPresent, animated: animated, completion: completion)
    }

    @nonobjc private static let _swizzlePresentationStyle: Void = {
        let instance: UIViewController = UIViewController()
        let aClass: AnyClass! = object_getClass(instance)

        let originalSelector = #selector(UIViewController.present(_:animated:completion:))
        let swizzledSelector = #selector(UIViewController.swizzled_present(_:animated:completion:))

        let originalMethod = class_getInstanceMethod(aClass, originalSelector)
        let swizzledMethod = class_getInstanceMethod(aClass, swizzledSelector)

        if let originalMethod = originalMethod, let swizzledMethod = swizzledMethod {
            if !class_addMethod(aClass, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod)) {
                method_exchangeImplementations(originalMethod, swizzledMethod)
            } else {
                class_replaceMethod(aClass, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
            }
        }
    }()

    @objc static func swizzlePresentationStyle() {
        _ = self._swizzlePresentationStyle
    }
}

extension UIView {
    static let loadingViewTag = 7305377166
    func showLoading(style: UIActivityIndicatorView.Style = .medium) {
        var loading = viewWithTag(UIImageView.loadingViewTag) as? UIActivityIndicatorView
            if loading == nil {
                loading = UIActivityIndicatorView(style: style)
            }
            loading?.translatesAutoresizingMaskIntoConstraints = false
            loading!.startAnimating()
            loading!.hidesWhenStopped = true
            loading?.tag = UIView.loadingViewTag
            addSubview(loading!)
          loading?.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            loading?.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }

    func stopLoading() {
        let loading = viewWithTag(UIView.loadingViewTag) as? UIActivityIndicatorView
            loading?.stopAnimating()
            loading?.removeFromSuperview()
    }
}

extension Optional where Wrapped == String {
    var optionalValue: String {
        guard let unwrapped = self else {
            return ""
        }
        return unwrapped
    }
}

extension String{
    public func trimmed() -> String {
        return self.components(separatedBy: CharacterSet.whitespacesAndNewlines).joined(separator: "")
    }
}
