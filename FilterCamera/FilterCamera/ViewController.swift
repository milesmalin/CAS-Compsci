//
//  ViewController.swift
//  FilterCamera
//
//  Created by Miles Malin on 3/4/20.
//  Copyright © 2020 Miles Malin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var filter1 = "CIPhotoEffectNoir"
    var filter2 = "CIPhotoEffectTonal"
    var filter3 = "CISepiaTone"
    var imageFilter = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.dismiss(animated: true, completion: nil)
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        //imageView.image = image
        
        let inputImage = image
        let context = CIContext(options: nil)
        if let filter = CIFilter(name: "\(imageFilter)"){
            let beginImage = CIImage(image: inputImage)
            filter.setDefaults()
            filter.setValue(beginImage, forKey: kCIInputImageKey)
            
            if let output = filter.outputImage {
                if let cgimg = context.createCGImage(output, from: output.extent) {
                    let processedImage = UIImage(cgImage: cgimg)
                    imageView.image = processedImage
                }
            }
        }
    }
    
    @IBAction func filter(_ sender: Any) {
        imageFilter = filter1
    }
    
    @IBAction func anotherFilter(_ sender: Any) {
        imageFilter = filter2
    }
    
    @IBAction func filterTres(_ sender: Any) {
        imageFilter = filter3
    }
    
    
    
    @IBAction func button(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera){
            let imageChooser = UIImagePickerController()
            imageChooser.delegate = self
            imageChooser.sourceType = .camera
            
            self.present(imageChooser, animated: true, completion: nil)
        }
    }
    
    
}
