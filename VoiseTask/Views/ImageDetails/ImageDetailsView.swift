//
//  ImageDetailsView.swift
//  VoiseTask
//
//  Created by Mustafa Magdy on 19/02/2023.
//

import SwiftUI
import Kingfisher

struct ImageDetailsView: View {
    var imageURLString: String?
    
    @State var averageColor: Color? = .white
    
    var body: some View {
        ZStack {
            averageColor.ignoresSafeArea()
            
            KFImage(imageURLString?.toURL)
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
                .onSuccess({ result in
                    averageColor = result.image.averageColor?.toSUColor
                })
                .scaledToFit()
                .cornerRadius(10)
                .padding(10)
                
        }
    }
}
