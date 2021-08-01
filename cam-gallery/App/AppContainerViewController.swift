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
    
    override func loadView() {
        super.loadView()
        view = containerView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

