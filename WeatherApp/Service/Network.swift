//
//  Network.swift
//  WeatherApp
//
//  Created by KODE-i7-1 on 18/01/2018.
//  Copyright © 2018 KODE-i7-1. All rights reserved.
//

import Foundation

import Alamofire
import ObjectMapper
import AlamofireObjectMapper

protocol NetworkErrorHandler {
    func networkRequest(request: URLRequest, error: Error)
}

typealias ResponseClosure = ((DataResponse<Any>) -> Void)

struct Network {
    // You can set this to a var if you want
    // to be able to create your own SessionManager
    let manager: SessionManager = SessionManager()
    static let shared = Network()
    var delegate: NetworkErrorHandler?
}

extension Network {
    
    func request(endpoint: Endpoint, completion: @escaping ResponseClosure) -> Request {
        let request = manager.request(
            endpoint.fullURL,
            method: endpoint.method,
            parameters: endpoint.body,
            encoding: endpoint.encoding
            //headers: endpoint.headers
            ).responseJSON { response in
                if response.result.isSuccess {
                    debugPrint(response.result.description)
                } else {
                    debugPrint(response.result.error ?? "Error")
                    // Can globably handle errors here if you want
                    if let urlRequest = response.request, let error = response.result.error {
                        print(urlRequest.debugDescription)
                        self.delegate?.networkRequest(request: urlRequest, error: error)
                    }
                }
                completion(response)
        }
        print(request.description)
        return request
    }
}
