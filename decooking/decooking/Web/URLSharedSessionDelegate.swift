//
//  URLSharedSessionDelegate.swift
//  decooking
//
//  Created by Иван Морозов on 10.11.2020.
//

import Foundation

class URLSharedSessionDelegate: NSObject, URLSessionDelegate {
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
            completionHandler(.useCredential, nil)
        }
}
