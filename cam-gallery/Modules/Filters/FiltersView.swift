//
//  FiltersView.swift
//  cam-gallery
//
//  Created by Samuel Silva on 01/08/21.
//

import UIKit

class FiltersView: UIView, BaseView {
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func setupExtraConfigurations() {
        backgroundColor = .systemBlue
    }
}
