//
//  UIViewController+Extensions.swift
//  cam-gallery
//
//  Created by Samuel Silva on 01/08/21.
//

import UIKit

extension UIViewController {
    func updateContainer(with viewController: UIViewController) {
        if let last = self.children.last {
            viewController.view.frame = last.view.frame
            last.willMove(toParent: nil)
            last.removeFromParent()
            last.view.removeFromSuperview()
        }
        
        addChild(viewController)
        view.addSubview(viewController.view)
        viewController.didMove(toParent: self)
    }
}
