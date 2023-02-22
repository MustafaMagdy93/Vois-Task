
import Foundation
import UIKit

protocol ApiProtocol {
    
    func getImagesList(pageNumber: Int, completion: @escaping (Result<[GetImageResponse]?, APError>) -> Void)
}


class Api: BaseAPI<Networking>, ApiProtocol {
    
    static let shared: ApiProtocol = Api()
    private let cache = NSCache<NSString, UIImage>()
    
    func getImagesList(pageNumber: Int, completion: @escaping (Result<[GetImageResponse]?, APError>) -> Void) {
        self.fetchData(target: .getImages(pageNumber: pageNumber), responseClass: [GetImageResponse].self) { result in
            completion(result)
        }
    }
}
