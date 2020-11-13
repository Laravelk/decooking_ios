//
//  Network.swift
//  decooking
//
//  Created by Иван Морозов on 10.11.2020.
//

import Foundation

class Network {
    private let URLBase = "https://decooking.ru"
    private let decoder = JSONDecoder()
    private let session: URLSession
    
    public enum RequestResult<Value> {
        case success(Value)
        case failure(Error)
    }
    
    public enum RequestError: Error {
        case wrongURL
        case loadFailed
        case failedToDecode
        case unknownError
    }
    
    init() {
        let configuration = URLSessionConfiguration.default
        self.session = URLSession(configuration: configuration, delegate: URLSharedSessionDelegate() , delegateQueue: nil)
    }
    
    private func getData<Value: Decodable>(url: String, completion: @escaping (RequestResult<Value>) -> Void) -> Void {
        let url = URL(string: url)
        if  url == nil {
            completion(RequestResult<Value>.failure(RequestError.wrongURL))
        }

        session.dataTask(with: url!) { (data, response, error) in
                var returnValue: RequestResult<Value> = RequestResult<Value>.failure(RequestError.loadFailed)

                guard let data = data else {
                    returnValue = RequestResult<Value>.failure(RequestError.loadFailed)
                    completion(returnValue)
                    return
                }
                do {
                    let loginSuccess = try self.decoder.decode(Value.self, from: data)
                    returnValue = RequestResult.success(loginSuccess)
                    completion(returnValue)
                } catch is DecodingError {
                    returnValue = RequestResult.failure(RequestError.failedToDecode)
                    completion(returnValue)
                } catch {
                    returnValue = RequestResult.failure(RequestError.unknownError)
                    completion(returnValue)
                }
            }.resume()
        }
    
    public func getAuthentication(email: String, password: String, completion: @escaping (RequestResult<AuthenticationData>) -> Void)  {
        let url: String = URLBase + "user/?email=\(email)?password=\(password)"
        self.getData(url: url) { (returnValue: RequestResult<AuthenticationData>) in
        
        }
    }

    
}
