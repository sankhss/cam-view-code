//
//  PhotoViewCell.swift
//  cam-gallery
//
//  Created by Samuel Silva on 01/08/21.
//

import UIKit

class PhotoViewCell: UICollectionViewCell, BaseView {
    
    public lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        addSubview(imageView)
    }
    
    func setupConstraints() {
        imageView.snp.makeConstraints { maker in
            maker.left.equalToSuperview().offset(0)
            maker.top.equalToSuperview().offset(0)
            maker.right.equalToSuperview().inset(0)
            maker.bottom.equalToSuperview().inset(0)
        }
    }
    
    func setupExtraConfigurations() {
        
    }
}
