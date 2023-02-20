
import Foundation

protocol ApiProtocol {
    
    func getImages(pageNumber: Int, completion: @escaping (Result<[GetImageResponse]?, GFError>) -> Void)
    
}


class Api: BaseAPI<ALphaNetworking>, ApiProtocol {
    
    static let shared: ApiProtocol = Api()
    
    func getImages(pageNumber: Int, completion: @escaping (Result<[GetImageResponse]?, GFError>) -> Void) {
        self.fetchData(target: .getImages(pageNumber: pageNumber), responseClass: [GetImageResponse].self) { result in
            completion(result)
        }
    }
}
