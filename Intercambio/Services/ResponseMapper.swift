//
//  ParseResponse.swift
//  Intercambio
//
//  Created by ensimerida on 20/12/18.
//  Copyright © 2018 ensimerida. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class ResponseMapper {
    static let SUCCESS = "success"
    static let ERROR = "error"
    
    static func parse<A: Mappable>(_ data: DataResponse<Any>, message: inout String) -> A?{
        let response = Mapper<Response>().map(JSON: data.value as! [String: Any])
        if response!.result == SUCCESS{
            let responseData = Mapper<A>().map(JSON: response!.data)
            return responseData
        }
        message = response!.message
        return nil
    }
}

class Response: Mappable {
    var result : String = ""
    var message : String = ""
    var data : [String: Any] = [:]
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        self.result <- map["result"]
        self.message <- map["message"]
        self.data <- map["data"]
    }
}
