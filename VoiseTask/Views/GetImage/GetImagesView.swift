//
//  ContentView.swift
//  VoiseTask
//
//  Created by Mustafa Magdy on 19/02/2023.
//

import SwiftUI


struct GetImagesView: View {
    
    @StateObject var viewModel = GetImageViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.images, id: \.id) { image in
                    ImageCell(image: image)
                    
//                    if viewModel.images.count == 5 {
//                            googleAddCell
//                    }
                }
                .navigationTitle("Images")
            }
            .onAppear { viewModel.getImages(pageNumber: 2) }
            
            if viewModel.isLoading { LoadingView() }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

extension GetImagesView {
    var googleAddCell: some View {
        Text("Add google ad here")
            .padding(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GetImagesView()
    }
}
