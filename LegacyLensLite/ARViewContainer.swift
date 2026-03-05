//
//  ARViewContainer.swift
//  LegacyLensLite
//
//  Created by Reyhan Ariq Syahalam on 26/04/24.
//

import SwiftUI
import RealityKit
import ARKit

struct ARViewContainer: UIViewRepresentable {
    @EnvironmentObject var viewModel: ARViewModel

    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        setupARView(arView)
        arView.session.delegate = self
        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {
        // Handle updates to the AR view when the app state changes
    }
}
