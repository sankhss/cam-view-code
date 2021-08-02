//
//  PhotoPreviewViewController.swift
//  cam-gallery
//
//  Created by Samuel Silva on 01/08/21.
//

import UIKit

class PhotoPreviewViewController: UIViewController {
    
    private let customView = PhotoPreviewView(frame: UIScreen.main.bounds)
    
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
    }
}
