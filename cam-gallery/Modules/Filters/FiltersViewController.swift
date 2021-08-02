//
//  FiltersViewController.swift
//  cam-gallery
//
//  Created by Samuel Silva on 01/08/21.
//

import UIKit

class FiltersViewController: UIViewController {
    
    private let customView = FiltersView(frame: UIScreen.main.bounds)
    
    override func loadView() {
        super.loadView()
        
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
