//
//  ARViewModel.swift
//  LegacyLensLite
//
//  Created by Reyhan Ariq Syahalam on 30/04/24.
//

import Foundation
import ARKit
import RealityKit

class ARViewModel: ObservableObject {
    private var arView: ARView?

    func setupARView(_ arView: ARView) {
        self.arView = arView
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        config.environmentTexturing = .automatic
        arView.session.run(config)

        // Set up any additional AR experiences
    }

    func handleUserInteraction() {
        // Handle user interactions like tapping on a plane
    }
}
