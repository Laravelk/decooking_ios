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
    
    private func getData<Value: Decodable>(url: String) -> RequestResult<Value> {
            var returnValue: RequestResult<Value> = RequestResult<Value>.failure(RequestError.loadFailed)
            guard let url = URL(string: url) else {
                return RequestResult.failure(RequestError.wrongURL)
            }

            session.dataTask(with: url) { (data, response, error) in
                guard let data = data else {
                    returnValue = RequestResult<Value>.failure(RequestError.loadFailed)
                    return
                }
                do {
                    let loginSuccess = try self.decoder.decode(Value.self, from: data)
                    returnValue = RequestResult.success(loginSuccess)
                } catch is DecodingError {
                    returnValue = RequestResult.failure(RequestError.failedToDecode)
                } catch {
                    returnValue = RequestResult.failure(RequestError.unknownError)
                }
            }.resume()
            return returnValue
        }
    
    public func getAuthentication(email: String, password: String) -> RequestResult<AuthenticationData> {
        let url: String = URLBase + "user/?email=\(email)?password=\(password)"
        return getData(url: url)
    }
    
    
}
