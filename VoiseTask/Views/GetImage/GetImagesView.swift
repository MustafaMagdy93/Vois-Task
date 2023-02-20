//
//  ContentView.swift
//  VoiseTask
//
//  Created by Mustafa Magdy on 19/02/2023.
//

import SwiftUI

struct GetImagesView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GetImagesView()
    }
}
