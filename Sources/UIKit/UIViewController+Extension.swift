//
//  UIViewController+Extension.swift
//  Template
//
//  Created by Lam Nguyen on 4/22/22.
//
#if !os(macOS)
import UIKit

public extension UIViewController {
    static var classIdentifier: String {
        return String(describing: self)
    }
    
    class var storyboardID: String {
        return "\(self)"
    }
    
    // return an instance UIViewController from storyboard with class name identifier
    class func instantiate(_ storyboard: UIStoryboard) -> Self {
        return storyboard.viewController(identifier: classIdentifier)
    }

    class func instantiateInitial(fromStoryboard storyboardName: String? = nil, bundle bundleOrNil: Bundle? = nil) -> Self {
        let storyboardName = storyboardName ?? classIdentifier
        return UIStoryboard.initialViewController(name: storyboardName, bundle: bundleOrNil)
    }

    class func instanceFromNibClass() -> Self {
        return self.init(nibName: self.classIdentifier, bundle: nil)
    }

    func initialViewController<T>() -> T {
        storyboard!.initialViewController()
    }

    func viewController<T: UIViewController>(identifier: String = T.classIdentifier) -> T {
        storyboard!.viewController(identifier: identifier)
    }
}


public extension UIViewController {
    var topMostViewController: UIViewController {
        if let viewController = self as? UINavigationController {
            return viewController.topViewController?.topMostViewController ?? viewController
        } else if let viewController = self as? UITabBarController {
            return viewController.selectedViewController?.topMostViewController ?? viewController
        } else if let viewController = self.presentedViewController {
            return viewController.topMostViewController
        }
        return self
    }

    var visibleMostViewController: UIViewController {
        if let viewController = self as? UINavigationController {
            return viewController.visibleViewController?.visibleMostViewController ?? self
        } else if let viewController = self as? UITabBarController {
            return viewController.selectedViewController?.visibleMostViewController ?? self
        } else if let viewController = self.presentedViewController {
            return viewController.visibleMostViewController
        }
        return self
    }

    var navigationItemTitle: String? {
        get { return navigationItem.title }
        set { navigationItem.title = newValue }
    }

    func hideBackBarButton() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: UIView(frame: CGRect.zero))
    }

    func show(_ vc: UIViewController?) {
        guard let vc = vc else { return }
        show(vc, sender: nil)
    }

    func showDetailViewController(_ vc: UIViewController?) {
        guard let vc = vc else { return }
        showDetailViewController(vc, sender: nil)
    }

    func present(onVC: UIViewController? = nil, modalStyle: UIModalPresentationStyle = .fullScreen, animated: Bool = true, completion: (() -> Void)? = nil) {
        guard let onVC = onVC ?? UIApplication.topMostViewController else { return }
        self.modalPresentationStyle = modalStyle
        onVC.present(self, animated: animated, completion: completion)
    }

    func navigationControllerRootSelf() -> UINavigationController {
        return UINavigationController(rootViewController: self)
    }
}

public extension UIViewController {
    func removePreviousViewController(with type: AnyClass) {
        guard let navigationController = self.navigationController
        else {
            return
        }
        
        var viewControllers = navigationController.viewControllers
        let numberViewController = viewControllers.count
        guard numberViewController >= 2 else {
            return
        }
        
        let previousIndex = numberViewController - 2
        let previousViewController = viewControllers[previousIndex]
        if previousViewController.isKind(of: type) {
            viewControllers.remove(at: previousIndex)
            navigationController.viewControllers = viewControllers
        } else {
            return
        }
    }
}
#endif
