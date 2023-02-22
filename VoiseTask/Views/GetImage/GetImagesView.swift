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
                List {
                    ForEach(viewModel.images, id: \.id){ image in
                        if image.isGoogleAds ?? false {
                            googleAddCell
                        } else {
                            ImageCell(image: image)
                            .listRowSeparator(.hidden)
                        }
                       
                    }
                    
                    if viewModel.shouldPaginate {
                            Text("fetching Data")
                            .onAppear{
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    viewModel.getImages(.next)
                                }
                            }
                            .listRowSeparator(.hidden)
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Images")
                .refreshable {
                    viewModel.getImages(.first)
                }
                
            }
            .onAppear { viewModel.getImages(.first) }
            
            if viewModel.isLoading { LoadingView() }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

extension GetImagesView {
    var googleAddCell: some View {
        Image("ads")
            .resizable()
            .frame(height: 80)
            .overlay(
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        Text("Powered by Google Ads")
                            .font(.caption)
                            .foregroundColor(.white)
                            .padding(5)
                    }
                }
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GetImagesView()
    }
}
