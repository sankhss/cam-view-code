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
        controller.delegate = self
        return controller
    }()
    
    private lazy var filtersViewController: FiltersViewController = {
        let controller = FiltersViewController()
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavigationBar()
    }
    
    @objc func cameraButtonPressed() {
        updateContainer(with: filtersViewController)
    }
    
    private func setupNavigationBar() {
        let cameraButton = UIButton.cameraButton()
        cameraButton.addTarget(self, action: #selector(cameraButtonPressed), for: .touchUpInside)
        
        navigationController?.navigationBar.tintColor = .white
        navigationItem.setLeftBarButton(UIBarButtonItem(customView: cameraButton), animated: true)
        
        title = "Cam Gallery"
    }
    
}

extension AppContainerViewController: GalleryViewControllerDelegate {
    func didSelect(photo: UIImage) {
        let photoPreviewViewController = PhotoPreviewViewController()
        photoPreviewViewController.photo = photo
        navigationController?.pushViewController(photoPreviewViewController, animated: true)
    }
}

