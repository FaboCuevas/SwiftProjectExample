//
//  grupos.swift
//  Intercambio
//
//  Created by ensimerida on 20/12/18.
//  Copyright © 2018 ensimerida. All rights reserved.
//

import Foundation
import ObjectMapper

class Grupo: Mappable {
    
    var id : Int = 0
    var nombre : String = ""
    var montoMinimo : Int = 0
    var fechaIntercambio : String = ""
    var usuarios : [Usuario] = []
    
    init(){
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        self.id <- map["id"]
        self.nombre <- map["nombre"]
        self.montoMinimo <- map["montoMinimo"]
        self.fechaIntercambio <- map["fechaIntercambio"]
    }
}
