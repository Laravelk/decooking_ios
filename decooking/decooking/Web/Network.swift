//
//  Network.swift
//  decooking
//
//  Created by Иван Морозов on 10.11.2020.
//

import Foundation
import UIKit

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
    
    private func postData<Value: Decodable>(url: String, options: [Any], completion: @escaping (RequestResult<Value>) -> Void) {
        guard let url = URL(string: url) else {
           completion(.failure(.wrongURL))
           return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: options) else {
            completion(.failure(.wrongParameters))
            return
        }
        
        request.httpBody = httpBody
        
        self.session.dataTask(with: request) { (data, response, error) in
           guard let data = data else {
               completion(.failure(.loadFailed))
               return
           }
            
//            print(String(data: data, encoding: .utf8))

            
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
    
    private func getPuctire(url: String, completion: @escaping (RequestResult<UIImage>) -> Void) {
        guard let url = URL(string: url) else {
           completion(.failure(.wrongURL))
           return
        }
        DispatchQueue.global().async {
            () in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    return completion(.success(image))
                } else {
                    return completion(.failure(.failedToDecode))
                }
            } else {
                return completion(.failure(.failedToDecode))
            }
        }
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
        self.getData(url: url, completion: completion)
    }
    
    public func getRecipes(ingredientsId: [String], completion: @escaping (RequestResult<Array<RecipeData>>) -> Void) {
        let url: String = URLBase + "/dev/recipe/findByIngredients"
        self.postData(url: url, options: ingredientsId, completion: completion)
    }
    
    public func getPicture(recipesId: String, completion: @escaping (RequestResult<UIImage>) -> Void) {
        let url: String = URLBase + "/dev/recipe/images_by_recipe/" + recipesId
        self.getPuctire(url: url, completion: completion)
    }
    
    public func getPictures(recipesId: [String], completion: @escaping (RequestResult<Array<RecipePicture>>) -> Void)
        {
        let url: String = URLBase + "/dev/recipe/images_by_recipe/"
    }
    
    public func getRecipesByName(name: String, complection: @escaping (RequestResult<Array<RecipeData>>) -> Void) {
//        let url: String = URLBase + ""
    }
}
