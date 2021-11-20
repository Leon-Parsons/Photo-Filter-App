//
//  ViewController.swift
//  Photo Filter App
//
//  Created by Leon on 17/11/21.
//

import UIKit
import CoreImage

class ViewController: UIViewController {
    
    //Basic model of filter data, to be sent to method to add filter
    struct Filter {
        
        let filterName: String
        var filterEffectValue: Any?
        var filterEffectValueName: String?
        
        init(filterName: String, filterEffectValue: Any?, filterEffectValueName: String?){
            self.filterName = filterName
            self.filterEffectValue = filterEffectValue
            self.filterEffectValueName = filterEffectValueName
        }
    }
    
    
    @IBOutlet weak var imgView: UIImageView!
    private var originalImage: UIImage?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Keep orginal unedited image on launch is user resets filters etc.
        originalImage = imgView.image
    }
    
    //Method to apply filter to image, returns this edited image to image view
    private func applyFilterTo(image: UIImage, filterEffect: Filter) -> UIImage?{
        
        //reference to Core Graphics image of UI Image, tells app to use the GPU of device
        guard let cgImage = image.cgImage, let openGLContext = EAGLContext(api: .openGLES3)  else {
            return nil
        }
        
        let context = CIContext(eaglContext: openGLContext)
        
        let ciImage = CIImage(cgImage: cgImage)
        let filter = CIFilter(name: filterEffect.filterName)
        
        filter?.setValue(ciImage, forKey: kCIInputImageKey)
        
        //Key value of filters applied here
        if let filterEffectValue = filterEffect.filterEffectValue,
           let filterEffectValueName = filterEffect.filterEffectValueName{
            filter?.setValue(filterEffectValue, forKey: filterEffectValueName)
        }
        
        //Render of image with filter
        var filteredImage: UIImage?
        
        if let output = filter?.value(forKey: kCIOutputImageKey) as? CIImage,
           let cgiImageResult = context.createCGImage(output, from: output.extent){
            
            filteredImage = UIImage(cgImage: cgiImageResult)
        }
        
        return filteredImage
    }



    @IBAction func applySepia(_ sender: Any) {
    }
    
    
    @IBAction func applyBlur(_ sender: Any) {
    }
    
    @IBAction func applyNoir(_ sender: Any) {
    }
    
    @IBAction func applyPhotoTransferEffect(_ sender: Any) {
    }
    
    
    @IBAction func clearFilters(_ sender: Any) {
    }
    
}

