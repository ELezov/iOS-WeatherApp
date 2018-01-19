//
//  CityService.swift
//  WeatherApp
//
//  Created by KODE-i7-1 on 18/01/2018.
//  Copyright © 2018 KODE-i7-1. All rights reserved.
//

import Foundation
import AlamofireObjectMapper
import ObjectMapper

class CityService {
    
    func getCityList(query: String, _ completion:@escaping ([City]?,Error?) -> Void){
        _ = Network.shared.request(endpoint: CityEndpoint.getCities(query: query)){
            response in
            switch(response.result){
            case .success(let _):
                if let result = Mapper<CityResult>().map(JSONObject: response.result.value) {
                     let cities = result.results;
                     completion(cities,nil)
                } else { completion(nil,nil)}
            case .failure(let error):
                print(error.localizedDescription)
                completion(nil,error)
            }
        }
    }
}
