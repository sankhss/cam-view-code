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
        controller.delegate = self
        return controller
    }()
    
    private lazy var filtersViewController: FiltersViewController = {
        let controller = FiltersViewController()
        controller.delegate = self
        return controller
    }()
    
    override func loadView() {
        super.loadView()
        view = containerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = []
        updateContainer(with: galleryViewController)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    
    @objc func cameraButtonPressed() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePickerViewController = UIImagePickerController()
            imagePickerViewController.sourceType = .camera
            imagePickerViewController.delegate = self
            present(imagePickerViewController, animated: true, completion: nil)
        }
    }
    
    private func setupNavigationBar() {
        let cameraButton = UIButton.cameraButton()
        cameraButton.addTarget(self, action: #selector(cameraButtonPressed), for: .touchUpInside)
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .systemPink
        navigationItem.setLeftBarButton(UIBarButtonItem(customView: cameraButton), animated: true)
        
        title = "Cam Gallery"
    }
    
}

//MARK: - GalleryViewController Delegate Methods

extension AppContainerViewController: GalleryViewControllerDelegate {
    func didSelect(photo: UIImage) {
        let photoPreviewViewController = PhotoPreviewViewController()
        photoPreviewViewController.photo = photo
        navigationController?.pushViewController(photoPreviewViewController, animated: true)
    }
}

//MARK: - FiltersViewController Delegate Methods

extension AppContainerViewController: FiltersViewControllerDelegate {
    func didFinished() {
        
    }
    func didCancel() {
        updateContainer(with: galleryViewController)
    }
}

//MARK: - UIImagePickerController Delegate Methods

extension AppContainerViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let photo = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        filtersViewController.photo = photo
        
        picker.dismiss(animated: true, completion: nil)
        updateContainer(with: filtersViewController)
    }
}
