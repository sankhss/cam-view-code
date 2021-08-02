//
//  UIButton+Extensions.swift
//  cam-gallery
//
//  Created by Samuel Silva on 01/08/21.
//

import UIKit

extension UIButton {
    static func cameraButton() -> UIButton {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        button.setImage(UIImage(systemName: "camera"), for: .normal)
        button.tintColor = .white
        return button
    }
}
