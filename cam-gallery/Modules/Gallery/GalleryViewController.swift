//
//  GalleryViewController.swift
//  cam-gallery
//
//  Created by Samuel Silva on 01/08/21.
//

import UIKit
import Photos

protocol GalleryViewControllerDelegate {
    func didSelect(photo: UIImage)
}

class GalleryViewController: UIViewController {
    
    private let customView = GalleryView(frame: UIScreen.main.bounds)
    private var photos = [PHAsset]()
    
    public var delegate: GalleryViewControllerDelegate?
    
    override func loadView() {
        super.loadView()
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        loadGallery()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func setupDelegates() {
        customView.collectionView.dataSource = self
        customView.collectionView.delegate = self
    }
    
    private func loadGallery() {
        requestUserGalleryPermission { [weak self] status in
            if status == .authorized {
                let assets = PHAsset.fetchAssets(with: .image, options: nil)
                assets.enumerateObjects { asset, count, stop in
                    self?.photos.append(asset)
                }
                
                self?.photos.reverse()
                self?.customView.collectionView.reloadData()
            }
        }
    }
    
    private func requestUserGalleryPermission(completion: @escaping (PHAuthorizationStatus) -> ()) {
        PHPhotoLibrary.requestAuthorization { status in
            DispatchQueue.main.async {
                completion(status)
            }
        }
    }
}

//MARK: - UICollectionView Methods

extension GalleryViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoViewCell", for: indexPath) as! PhotoViewCell
        
        let asset = photos[indexPath.item]
        PHImageManager.default().requestImage(for: asset, targetSize: CGSize(width: 100, height: 100), contentMode: .aspectFill, options: nil) { image, _ in
            DispatchQueue.main.async {
                cell.imageView.image = image
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let asset = photos[indexPath.item]
        let options = PHImageRequestOptions()
        options.isSynchronous = true
        
        PHImageManager.default().requestImage(for: asset, targetSize: CGSize(width: 320, height: 480), contentMode: .aspectFill, options: options) { image, _ in
            if let image = image {
                self.delegate?.didSelect(photo: image)
            }
        }
    }
}
