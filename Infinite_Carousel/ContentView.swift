//
//  ContentView.swift
//  Infinite_Carousel
//
//  Created by vignesh kumar c on 20/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Home()
                .navigationTitle("Infinite carousel")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
