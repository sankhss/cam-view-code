//
//  BaseView.swift
//  cam-gallery
//
//  Created by Samuel Silva on 01/08/21.
//

import Foundation
import SnapKit

protocol BaseView {
    func addViews()
    func setupConstraints()
    func setupExtraConfigurations()
}

extension BaseView {
    func setup() {
        addViews()
        setupConstraints()
        setupExtraConfigurations()
    }
}
