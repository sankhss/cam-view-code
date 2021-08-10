//
//  FilterService.swift
//  cam-gallery
//
//  Created by Samuel Silva on 09/08/21.
//

import UIKit
import CoreImage

struct FilterService {
    private var context: CIContext
    
    init() {
        context = CIContext()
    }
    
    static func all() -> [CIFilter] {
        let blur = CIFilter(name: "CIGaussianBlur")!
        blur.setValue(5.0, forKey: kCIInputRadiusKey)
        
        let halftone = CIFilter(name: "CICMYKHalftone")!
        halftone.setValue(5.0, forKey: kCIInputWidthKey)
        
        let crystalize = CIFilter(name: "CICrystallize")!
        crystalize.setValue(5.0, forKey: kCIInputRadiusKey)
        
        let monochrome = CIFilter(name: "CIColorMonochrome")!
        monochrome.setValue(CIColor(red: 0.7, green: 0.7, blue: 0.7), forKey: kCIInputColorKey)
        monochrome.setValue(10, forKey: kCIInputIntensityKey)
        
        let sepia = CIFilter(name: "CISepiaTone")!
        sepia.setValue(10, forKey: kCIInputIntensityKey)
        
        return [blur, halftone, crystalize, monochrome, sepia]
    }
}
