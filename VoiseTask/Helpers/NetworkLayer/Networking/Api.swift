
import Foundation

protocol ApiProtocol {
//      func getToken(username: String, password: String, grant_type: String, scope: String, client_id: String, client_secret: String, completion: @escaping (Result<TokenResponse?, GFError>) -> Void)

}


class Api: BaseAPI<ALphaNetworking>, ApiProtocol {
    
    static let shared: ApiProtocol = Api()
    
//    func getToken(username: String, password: String, grant_type client_id: String, scope grant_type: String, client_id scope: String, client_secret: String, completion: @escaping (Result<TokenResponse?, GFError>) -> Void) {
//        self.postData(target: .getToken(username: username, password: password, grant_type: client_id, scope: grant_type, client_id: scope, client_secret: client_secret), responseClass: TokenResponse.self) { (result) in
//            completion(result)
//        }
//    }
}
