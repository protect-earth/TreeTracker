import Alamofire
import Foundation

class RetryingRequestInterceptor: RequestInterceptor {
    var maxRetries: Int = 5
    var retryDelay: TimeInterval = 10
    
    init(retryDelaySecs: Int, maxRetries retryLimit: Int) {
        self.retryDelay = TimeInterval(retryDelaySecs)
        self.maxRetries = retryLimit
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        let response = request.task?.response as? HTTPURLResponse
        
        if let statusCode = response?.statusCode, (500...599).contains(statusCode), request.retryCount < maxRetries {
            completion(.retryWithDelay(retryDelay))
        } else {
            return completion(.doNotRetry)
        }
    }
}
