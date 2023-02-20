//
//  GetImageViewModel.swift
//  VoiseTask
//
//  Created by Mustafa Magdy on 20/02/2023.
//

import Foundation
import Combine

class GetImageViewModel: ObservableObject  {
    
    @Published var images: [GetImageResponse] = []
    @Published var isLoading = false
    @Published var alertItem: AlertItem?
    
    func getImages(pageNumber: Int) {
        isLoading = true
        Api.shared.getImagesList(pageNumber: pageNumber) { [weak self] result in
            self?.isLoading = false
            switch result {
                case .success(let response):
                self?.images = response ?? []
            case let .failure(error):
                switch error {
                case .invalidData:
                    self?.alertItem = AlertContext.invalidData
                    
                case .invalidURL:
                    self?.alertItem = AlertContext.invalidURL
                    
                case .invalidResponse:
                    self?.alertItem = AlertContext.invalidResponse
                    
                case .unableToComplete:
                    self?.alertItem = AlertContext.unableToComplete
                }
            }
        }
    }
    
}
