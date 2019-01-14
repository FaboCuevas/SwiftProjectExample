//
//  Regalo.swift
//  Intercambio
//
//  Created by ensimerida on 20/12/18.
//  Copyright © 2018 ensimerida. All rights reserved.
//

import Foundation
import ObjectMapper

class Regalo: Mappable{
    var id : Int = 0
    var nombre : String = ""
    var descripcion : String = ""
    var prioridad : Int = 0
    
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        self.id <- map["id"]
        self.nombre <- map["nombre"]
        self.descripcion <- map["descripcion"]
        self.prioridad <- map["prioridad"]
    }
    
}
