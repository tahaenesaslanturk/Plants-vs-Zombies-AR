//
//  ViewController.swift
//  Plants vs Zombies AR
//
//  Created by Taha Enes Aslantürk on 10.09.2022.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        sceneView.autoenablesDefaultLighting = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        if let imageToTrack = ARReferenceImage.referenceImages(inGroupNamed: "Cards", bundle: .main){
            configuration.detectionImages = imageToTrack
            
            configuration.maximumNumberOfTrackedImages = 3
            print("Images are successfully added")
        }

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    

    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
        
        if let imageAnchor = anchor as? ARImageAnchor {
            
            let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
            plane.firstMaterial?.diffuse.contents = UIColor(white: 1, alpha: 0.3)
            
            let planeNode = SCNNode(geometry: plane)
            
            planeNode.eulerAngles.x = -.pi/2
            node.addChildNode(planeNode)
            
            
            if imageAnchor.referenceImage.name == "peashooter" {
                print("Peashooter detected!")
                if let scene = SCNScene(named: "art.scnassets/peashooter.scn"){
                    if let sceneNode = scene.rootNode.childNode(withName: "peashooter", recursively: false){
                        sceneNode.eulerAngles.x = .pi/2
                        planeNode.addChildNode(sceneNode)
                    }
                }
            }
            
            if imageAnchor.referenceImage.name == "potatomine" {
                print("Potatomine detected!")
                if let scene = SCNScene(named: "art.scnassets/Potato_Mine.scn"){
                    if let sceneNode = scene.rootNode.childNode(withName: "scene", recursively: false){
                        sceneNode.eulerAngles.x = .pi/2
                        planeNode.addChildNode(sceneNode)
                    }
                }
            }
            if imageAnchor.referenceImage.name == "repeater" {
                print("Repeater detected!")
                if let scene = SCNScene(named: "art.scnassets/repeater.scn"){
                    if let sceneNode = scene.rootNode.childNode(withName: "repeater", recursively: false){
                        sceneNode.eulerAngles.x = .pi/2
                        planeNode.addChildNode(sceneNode)
                    }
                }
            }
            if imageAnchor.referenceImage.name == "snowpea" {
                print("Snow pea detected!")
                if let scene = SCNScene(named: "art.scnassets/snow_pea.scn"){
                    if let sceneNode = scene.rootNode.childNode(withName: "snow_pea", recursively: false){
                        sceneNode.eulerAngles.x = .pi/2
                        planeNode.addChildNode(sceneNode)
                    }
                }
            }
            if imageAnchor.referenceImage.name == "splitpea" {
                print("Split Pea detected!")
                if let scene = SCNScene(named: "art.scnassets/split_Pea.scn"){
                    if let sceneNode = scene.rootNode.childNode(withName: "split_pea_not_rigged", recursively: false){
                        sceneNode.eulerAngles.x = .pi/2
                        planeNode.addChildNode(sceneNode)
                    }
                }
            }
            if imageAnchor.referenceImage.name == "sunflower" {
                print("Sunflower detected!")
                if let scene = SCNScene(named: "art.scnassets/sunflower.scn"){
                    if let sceneNode = scene.rootNode.childNode(withName: "sunflower", recursively: false){
                        sceneNode.eulerAngles.x = .pi/2
                        planeNode.addChildNode(sceneNode)
                    }
                }
            }
            if imageAnchor.referenceImage.name == "wallnut" {
                print("Wall nut detected!")
                if let scene = SCNScene(named: "art.scnassets/wall_nut.scn"){
                    if let sceneNode = scene.rootNode.childNode(withName: "wall_nut", recursively: false){
                        sceneNode.eulerAngles.x = .pi/2
                        planeNode.addChildNode(sceneNode)
                    }
                }
            }
               
            
            
            
        }
     
        return node
    }

    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
