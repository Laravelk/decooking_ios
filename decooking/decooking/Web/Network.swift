//
//  Network.swift
//  decooking
//
//  Created by Иван Морозов on 10.11.2020.
//

import Foundation

class Network {
    private let domainName = "www.decooking.ru"
    private let URLBase: String
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
        case catchedError(error: Error)
        case backendError(number: Int)
        case noLoadedDataYet
        case wrongParameters
    }
    
    init() {
        self.URLBase = "https://" + self.domainName
        let configuration = URLSessionConfiguration.default
        self.session = URLSession(configuration: configuration, delegate: URLSharedSessionDelegate(domainName: self.domainName) , delegateQueue: nil)
    }
    
    private func getData<Value: Decodable>(url: String, completion: @escaping (RequestResult<Value>) -> Void) {
        guard let networkURL = URL(string: url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) else {
            completion(.failure(.wrongURL))
            return
        }

        self.session.dataTask(with: networkURL) { (data, response, error) in
            guard let data = data else {
                completion(.failure(.loadFailed))
                return
            }
                        
            if let response = response as? HTTPURLResponse {
                let correctCode = 200
                if correctCode != response.statusCode {
                    completion(.failure(RequestError.backendError(number: response.statusCode)))
                    return
                }
            }
            
            do {
                let decodingResult = try self.decoder.decode(Value.self, from: data)
                completion(.success(decodingResult))
            } catch is DecodingError {
                completion(.failure(RequestError.failedToDecode))
            } catch let error {
                completion(.failure(RequestError.catchedError(error: error)))
            }
        }.resume()
    }
    
    private func postData<Value: Decodable>(url: String, parameters: [String:Any] ,completion: @escaping (RequestResult<Value>) -> Void) {
        guard let url = URL(string: url) else {
           completion(.failure(.wrongURL))
           return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
            completion(.failure(.wrongParameters))
            return
        }
        
        request.httpBody = httpBody
        
        self.session.dataTask(with: request) { (data, response, error) in
           guard let data = data else {
               completion(.failure(.loadFailed))
               return
           }
            
            if let response = response as? HTTPURLResponse {
                let correctCode = 200
                if correctCode != response.statusCode {
                    completion(.failure(RequestError.backendError(number: response.statusCode)))
                    return
                }
            }
            
           do {
               let decodingResult = try self.decoder.decode(Value.self, from: data)
               completion(.success(decodingResult))
           } catch is DecodingError {
               completion(.failure(RequestError.failedToDecode))
           } catch let anotherError {
               completion(.failure(RequestError.catchedError(error: anotherError)))
           }
       }.resume()
   }
    
    public func getAuthentication(email: String, password: String, completion: @escaping (RequestResult<AuthenticationData>) -> Void) {
        let url: String = URLBase + "/dev/login"
        let parameters: [String:String] = ["email": email, "password": password]
        self.postData(url: url, parameters: parameters, completion: completion)
        }
    
    public func register(username: String, email: String, password: String, completion: @escaping (RequestResult<RegisterData>) -> Void) {
        let url: String = URLBase + "/dev/register"
        let parameters: [String:String] = ["username": username, "email": email, "password": password]
        self.postData(url: url, parameters: parameters, completion: completion)
    }
    
    public func resetPassword(email: String, completion: @escaping (RequestResult<ForgotData>) -> Void) {
        let url: String = URLBase + "/dev/login/reset_password"
        let parameters: [String:String] = ["email": email]
        self.postData(url: url, parameters: parameters, completion: completion)
    }
    
    public func getIngredients(part: String, completion: @escaping (RequestResult<Array<Ingredient>>) -> Void) {
        let url = URLBase + "/dev/ingredients_type/" + part
        print(url)
        self.getData(url: url, completion: completion)
    }
}
