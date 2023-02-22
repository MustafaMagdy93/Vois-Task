//
//  ImageCell.swift
//  VoiseTask
//
//  Created by Mustafa Magdy on 20/02/2023.
//

import SwiftUI
import Kingfisher

struct ImageCell: View {
    
    let image: GetImageResponse?
    
    var body: some View {
        HStack(spacing: 15) {
            KFImage(image?.downloadURL?.toURL)
                .placeholder {
                    Image("imagePlaceholder")
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                        .opacity(0.5)
                        .overlay(
                            ProgressView().foregroundColor(.black)
                        )
                }
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .cornerRadius(10)
                .shadow(color: .gray, radius: 8)
            
            Text(image?.author ?? "N/A")
                    .font(.title2)
                    .fontWeight(.medium)
            Spacer()
        }
        .padding()
        .background(
            Color.white
                .cornerRadius(10)
                .shadow(color: .gray, radius: 8)
        )
        .background(
            NavigationLink("") {
                ImageDetailsView(imageURLString: image?.downloadURL)
            }
        )
    }
}


struct AppetizerCell_Previews: PreviewProvider {
    static var previews: some View {
        ImageCell(image: GetImageResponse(id: "0", author: "Mustafa", width: 5000, height: 3333, url: "", downloadURL: "https://picsum.photos/id/1/5000/3333"))
    }
}
