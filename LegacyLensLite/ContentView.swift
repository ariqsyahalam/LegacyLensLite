//
//  ContentView.swift
//  LegacyLensLite
//
//  Created by Reyhan Ariq Syahalam on 26/04/24.
//

import SwiftUI
import ARKit

struct ContentView: View {
    @State private var arView: ARSCNView?

    var body: some View {
        ZStack(alignment: .bottom) {
            ARViewContainer(arView: $arView)
            Button(action: takeSnapshot) {
                Image(systemName: "camera")
                    .frame(width: 60, height: 60)
                    .font(.title)
                    .background(Color.white.opacity(0.75))
                    .cornerRadius(30)
                    .padding()
            }
        }
    }

    func takeSnapshot() {
        if let image = arView?.snapshot() {
            let compressedImage = UIImage(data: image.pngData()!)
            UIImageWriteToSavedPhotosAlbum(compressedImage!, nil, nil, nil)
        }
    }
}


#Preview {
    ContentView()
}
