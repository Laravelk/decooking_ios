//
//  URLSessionDelegate.swift
//
//  Created by Иван Морозов on 09.11.2020.
//

import Foundation


class URLSharedSessionDelegate: NSObject, URLSessionDelegate {
    private var domainName: String
    init(domainName: String) {
        self.domainName = domainName
        super.init()
    }

    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        let protectionSpace = challenge.protectionSpace
        guard protectionSpace.authenticationMethod ==
            NSURLAuthenticationMethodServerTrust,
              protectionSpace.host.contains(self.domainName) else {
                completionHandler(.performDefaultHandling, nil)
                return
        }
        guard let serverTrust = protectionSpace.serverTrust else {
            completionHandler(.performDefaultHandling, nil)
            return
        }
        let credential = URLCredential(trust: serverTrust)
        completionHandler(.useCredential, credential)
    }
    
}
