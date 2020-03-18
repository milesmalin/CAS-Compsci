//
//  ViewController.swift
//  FirstARApp
//
//  Created by Miles Malin on 3/9/20.
//  Copyright © 2020 Miles Malin. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet weak var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sceneView.delegate = self
        let scene = SCNScene(named: "arresources.scnassets/blank.scn")
        sceneView.scene = scene!
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARImageTrackingConfiguration()
        sceneView.session.run(configuration)
        setTrackingImages("TargetImages", for: configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        sceneView.session.pause()
    }
    
    func setTrackingImages(_ groupName: String, for configuration: ARImageTrackingConfiguration){
        guard let trackingImages = ARReferenceImage.referenceImages(inGroupNamed:"arresources.scnassets/blank.scn", bundle: .main) else {
            print("No image found")
            return
            
        }
        configuration.trackingImages = trackingImages
        configuration.maximumNumberOfTrackedImages = 3
    }
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        
        print("Image found")
        
        let node = SCNNode()
        
        return node
        
    }
    
    
}

