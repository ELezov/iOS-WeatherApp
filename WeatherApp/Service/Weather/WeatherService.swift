//
//  WeatherService.swift
//  WeatherApp
//
//  Created by KODE-i7-1 on 18/01/2018.
//  Copyright © 2018 KODE-i7-1. All rights reserved.
//

import Foundation
import AlamofireObjectMapper
import ObjectMapper

class WeatherService {
    
    func getWeather(cityName: String, _ completion:@escaping (WeatherResult?, Error?) -> Void){
        _ = Network.shared.request(endpoint: WeatherEndpoint.getWeather(cityName: cityName)){
            response in
            switch(response.result){
            case .success( _):
                if let result = Mapper<WeatherResult>().map(JSONObject: response.result.value) {
                    completion(result,nil)
                } else { completion(nil,nil)}
            case .failure(let error):
                print(error.localizedDescription)
                completion(nil, error)
            }
        }
    }
}
