//
//  ARViewContainer.swift
//  LegacyLensLite
//
//  Created by Reyhan Ariq Syahalam on 26/04/24.
//

import SwiftUI
import ARKit

struct ARViewContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> ARSCNView {
        let arView = ARSCNView(frame: .zero)
        arView.delegate = context.coordinator
        
        let configuration = ARImageTrackingConfiguration()
        if let trackedImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) {
            configuration.trackingImages = trackedImages
            configuration.maximumNumberOfTrackedImages = 1
            print("ARSession configured with \(trackedImages.count) images.")
        } else {
            print("No images available to track.")
        }
        arView.session.run(configuration)
        return arView
    }
    
    func updateUIView(_ uiView: ARSCNView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, ARSCNViewDelegate {
        var parent: ARViewContainer
        
        init(_ parent: ARViewContainer) {
            self.parent = parent
        }
        
        func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
            if let imageAnchor = anchor as? ARImageAnchor {
                let referenceImage = imageAnchor.referenceImage
                print("Detected image named: \(referenceImage.name ?? "Unknown") at \(node.position)")
                DispatchQueue.main.async {
                    let cubeNode = self.createCubeNode()
                    node.addChildNode(cubeNode)
                    print("Cube node added to the scene.")
                }
            } else {
                print("The added anchor is not an image anchor.")
            }
        }


        func createCubeNode() -> SCNNode {
            let cubeGeometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
            cubeGeometry.firstMaterial?.diffuse.contents = UIColor.blue
            let cubeNode = SCNNode(geometry: cubeGeometry)
            print("Created a cube node with dimensions 0.1m x 0.1m x 0.1m.")
            return cubeNode
        }


        
    }
}

