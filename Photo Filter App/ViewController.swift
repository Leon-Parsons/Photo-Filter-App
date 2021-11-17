//
//  ViewController.swift
//  Photo Filter App
//
//  Created by Leon on 17/11/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Keep orginal unedited image on launch is user resets filters etc.
        OrginalPic = imgView.image
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

