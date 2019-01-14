//
//  APIUsuarios.swift
//  Intercambio
//
//  Created by ensimerida on 20/12/18.
//  Copyright © 2018 ensimerida. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire

class APIUsuarios {
    
    class func Login(
        _ user: String,
        _ pass: String,
        success: @escaping (_ entity : Usuario) -> Void,
        fail : @escaping (_ errMsg : String) -> Void) {
        let url = Config.login(user: user, pass: pass)
        let params : [String:Any] = [:]
        let request = Service.sharedInstance.get(url, params: params)
        //(DataResponse<Any>) -> {}Void
        request.responseJSON{
            response in
            Logger.debug(response)
            var msg = ""
            guard let usuario :  Usuario = ResponseMapper.parse(response, message: &msg) else{
                if msg == ""{
                    msg = "Error al obtener datos"
                }
                fail(msg)
                return
            }
            success(usuario)
        }
    }
}
