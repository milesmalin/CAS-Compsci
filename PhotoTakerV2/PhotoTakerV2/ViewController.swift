//
//  ViewController.swift
//  PhotoTakerV2
//
//  Created by Miles Malin on 2/27/20.
//  Copyright © 2020 Miles Malin. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var stackView: UIStackView!
    
    var takerController:
    UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video, completionHandler: {(_)in return})
        default: return
            
        }
        
    }
    
    @IBAction func takePhoto(_ sender: Any) {
        takeIt()
        //switch AVCaptureDevice.authorizationStatus(for: .video) {
        //case .authorized:
        //self.setupCaptureSession()
        //case .notDetermined:
        // AVCaptureDevice.requestAccess(for: .video) { granted in
        //   if granted {
        //     self.setupCaptureSession()
    }
    func takeIt() {
        takerController = UIImagePickerController()
        takerController.delegate = self
        takerController.sourceType = .camera
        present(takerController, animated: true, completion: nil)
        
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        takerController.dismiss(animated: true, completion: nil)
        imageButton(image: info[.originalImage] as! UIImage)
        let pic = info[.originalImage] as? UIImage
        imageButton(image: pic!)
        
    }
    
    func imageButton(image: UIImage) {
        let goodButton = UIButton()
        goodButton.setImage(image, for: .normal)
        stackView.addArrangedSubview(goodButton)
        stackView.frame = CGRect(x: 0, y: 0, width: 250, height: (20*20))
        scrollView.contentSize = CGSize(width: 400, height: 10*10)
    }
    /* case .restricted:
     return
     case .denied:
     return
     @unknown default:
     return
     }
     }
     
     func setupCaptureSession() {
     print("Take a Photo")
     }
     
     */
}
