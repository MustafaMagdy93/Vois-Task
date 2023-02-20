//
//  ImageCell.swift
//  VoiseTask
//
//  Created by Mustafa Magdy on 20/02/2023.
//

import SwiftUI

struct ImageCell: View {
    
    let image: GetImageResponse?
    
    
    var body: some View {
        HStack(spacing: 15) {
            FetchRemoteImage(urlString: image?.downloadURL ?? "")
                .aspectRatio(contentMode: .fit)
//                .frame(width: 150, height: 150)
                .cornerRadius(8)
            
            Text(image?.author ?? "N/A")
                    .font(.title2)
                    .fontWeight(.medium)
        }
        .padding()
    }
}


struct AppetizerCell_Previews: PreviewProvider {
    static var previews: some View {
        ImageCell(image: GetImageResponse(id: "0", author: "Mustafa", width: 5000, height: 3333, url: "", downloadURL: "https://picsum.photos/id/1/5000/3333"))
    }
}
