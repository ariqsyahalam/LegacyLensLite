//
//  ContentView.swift
//  LegacyLensLite
//
//  Created by Reyhan Ariq Syahalam on 26/04/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ARViewModel()

    var body: some View {
        ZStack {
            ARViewContainer()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Button("Interact") {
                    viewModel.handleUserInteraction()
                }
            }
        }
        .environmentObject(viewModel)
    }
}



#Preview {
    ContentView()
}
