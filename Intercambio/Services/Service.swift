//
//  Service.swift
//  Intercambio
//
//  Created by ensimerida on 20/12/18.
//  Copyright © 2018 ensimerida. All rights reserved.
//

import Foundation
import Alamofire

class Service {
    
    public class var sharedInstance: Service {
        struct Static {
            static let instance : Service = Service()
        }
        return Static.instance
    }
    
    static var acceptableStatusCodes: [Int] { return Array(200..<300) }
    
    func getHeaders() -> HTTPHeaders {
        var headers : [String:String] = [:];
        headers["Accept"] = "application/json"
        headers["Content-type"] = "application/json"
        headers["Authorization"] = ""
        return headers;
    }
    
    func post(_ url:String, params : [String: Any]) -> DataRequest {
        let request = Alamofire.request(
            url,
            method: .post,
            parameters: params,
            encoding: JSONEncoding.default,
            headers: getHeaders())
        Logger.debug(request)
        return request;
    }
    
    func get(_ url:String, params : [String: Any]) -> DataRequest {
        let request = Alamofire.request(
            url,
            method: .get,
            parameters: params,
            headers: getHeaders())
        Logger.debug(request)
        return request;
    }
}
