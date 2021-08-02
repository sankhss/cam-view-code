//
//  FiltersViewController.swift
//  cam-gallery
//
//  Created by Samuel Silva on 01/08/21.
//

import UIKit

protocol FiltersViewControllerDelegate {
    func didFinished()
    func didCancel()
}

class FiltersViewController: UIViewController {
    
    fileprivate let customView = FiltersView(frame: UIScreen.main.bounds)
    
    var delegate: FiltersViewControllerDelegate?
    
    var photo: UIImage! {
        didSet {
            customView.imageView.image = photo
        }
    }
    
    override func loadView() {
        super.loadView()
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        parent?.navigationController?.navigationBar.barTintColor = .systemBlue
    }

}

//MARK: - Actions Control

extension FiltersViewController {
    private func setupActions() {
        customView.cancelAction = cancelAction
        customView.doneAction = doneAction
    }
    
    private func cancelAction() {
        delegate?.didCancel()
    }
    
    private func doneAction() {
        delegate?.didFinished()
    }
}
