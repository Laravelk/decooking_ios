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
        case failure(RequestError)
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
    
    private func getData<Value: Decodable>(url: String, completion: @escaping (RequestResult<Value>) -> Void) {
             guard let url = URL(string: url) else {
                completion(.failure(.wrongURL))
                return
            }

            self.session.dataTask(with: url) { (data, response, error) in
                guard let data = data else {
                    completion(.failure(.loadFailed))
                    return
                }
                do {
                    let decodingResult = try self.decoder.decode(Value.self, from: data)
                    completion(.success(decodingResult))
                } catch is DecodingError {
                    completion(.failure(RequestError.failedToDecode))
                } catch {
                    completion(.failure(RequestError.unknownError))
                }
            }.resume()
        }
    
    public func getNearestEvents(email: String, password: String,completion: @escaping (RequestResult<AuthenticationData>) -> Void) {
            let url: String = URLBase + "user/?email=\(email)?password=\(password)"
            self.getData(url: url, completion: completion)
        }
}
