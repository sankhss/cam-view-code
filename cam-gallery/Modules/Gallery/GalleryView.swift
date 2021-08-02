//
//  GalleryView.swift
//  cam-gallery
//
//  Created by Samuel Silva on 01/08/21.
//

import UIKit

class GalleryView: UIView, BaseView {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 100, height: 100)
        
        return UICollectionView(frame: self.frame, collectionViewLayout: layout)
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        addSubview(collectionView)
    }
    
    func setupConstraints() {
        collectionView.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(0)
            maker.left.equalToSuperview().offset(0)
            maker.right.equalToSuperview().inset(0)
            maker.bottom.equalToSuperview().inset(0)
        }
    }
    
    func setupExtraConfigurations() {
        collectionView.backgroundColor = .systemPink
        collectionView.register(PhotoViewCell.self, forCellWithReuseIdentifier: "photoViewCell")
    }
}
