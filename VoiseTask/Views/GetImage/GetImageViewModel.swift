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
    @Published var shouldPaginate = true
    
    private var pageIndex = 0
    
    
    enum Page {
        case next
        case first
    }
    
    func getImages(_ atPage: Page = .first) {
        guard !isLoading else { return }
        
        switch atPage {
        case .next:
            pageIndex += 1
        case .first:
            pageIndex = 0
            isLoading.toggle()
        }
        debugPrint("Images count \(images.count)")
        Api.shared.getImagesList(pageNumber: pageIndex) { [weak self] result in
            self?.isLoading = false
            switch result {
                case .success(let response):
                guard let response = response, !response.isEmpty else {
                    self?.alertItem = AlertContext.invalidData
                    return
                }
                if atPage == .first { self?.images.removeAll() }
                let responseItem = response.adding(.init(isGoogleAds: true), afterEvery: 5)
                self?.images.append(contentsOf: responseItem)
                
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
