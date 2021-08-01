//
//  ViewController.swift
//  cam-gallery
//
//  Created by Samuel Silva on 01/08/21.
//

import UIKit

typealias AppContainerView = UIView

class AppContainerViewController: UIViewController {
    
    private let containerView = AppContainerView(frame: UIScreen.main.bounds)
    
    private lazy var galleryViewController: GalleryViewController = {
        let controller = GalleryViewController()
        controller.view.frame = containerView.frame
        return controller
    }()
    
    override func loadView() {
        super.loadView()
        view = containerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateContainer(with: galleryViewController)
    }
    
    private func updateContainer(with viewController: UIViewController) {
        addChild(viewController)
        containerView.addSubview(viewController.view)
        viewController.didMove(toParent: self)
    }
    
}

