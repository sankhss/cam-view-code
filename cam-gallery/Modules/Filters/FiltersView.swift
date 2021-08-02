//
//  FiltersView.swift
//  cam-gallery
//
//  Created by Samuel Silva on 01/08/21.
//

import UIKit

class FiltersView: UIView {
    
    var cancelAction: (() -> Void)?
    var doneAction: (() -> Void)?
    
    lazy var toolbar: UIToolbar = {
        let toolbar = UIToolbar()
        let done = UIBarButtonItem(systemItem: .done)
        done.action = #selector(doneButtonAction)
        let cancel = UIBarButtonItem(systemItem: .cancel)
        cancel.action = #selector(cancelButtonAction)
        let space = UIBarButtonItem(systemItem: .flexibleSpace)
        toolbar.tintColor = .white
        toolbar.setItems([cancel, space, done], animated: false)
        return toolbar
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Button Actions Methods

extension FiltersView {
    @objc func doneButtonAction() {
        doneAction?()
    }
    
    @objc func cancelButtonAction() {
        cancelAction?()
    }
}

//MARK: - BaseView Methods

extension FiltersView: BaseView {
    func addViews() {
        addSubview(toolbar)
        addSubview(imageView)
        addSubview(scrollView)
    }
    
    func setupConstraints() {
        toolbar.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(0)
            maker.left.equalToSuperview().offset(0)
            maker.right.equalToSuperview().inset(0)
        }
        
        imageView.snp.makeConstraints { maker in
            maker.top.equalTo(toolbar.snp.bottom).offset(8)
            maker.left.equalToSuperview().offset(0)
            maker.right.equalToSuperview().inset(0)
            maker.height.equalToSuperview().multipliedBy(0.64)
        }
        
        scrollView.snp.makeConstraints { maker in
            maker.top.equalTo(imageView.snp.bottom).offset(8)
            maker.left.equalToSuperview().offset(0)
            maker.right.equalToSuperview().inset(0)
            maker.bottom.equalToSuperview().inset(0)
        }
    }
    
    func setupExtraConfigurations() {
        backgroundColor = .systemBlue
        scrollView.backgroundColor = .systemGreen
        toolbar.backgroundColor = .clear
    }
}
