//
//  UIViewController+Extensions.swift
//  cam-gallery
//
//  Created by Samuel Silva on 01/08/21.
//

import UIKit

extension UIViewController {
    func updateContainer(with viewController: UIViewController) {
        addChild(viewController)
        view.addSubview(viewController.view)
        viewController.didMove(toParent: self)
    }
}
