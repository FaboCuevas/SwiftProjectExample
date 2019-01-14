//
//  usuarios.swift
//  Intercambio
//
//  Created by ensimerida on 20/12/18.
//  Copyright © 2018 ensimerida. All rights reserved.
//

import Foundation
import ObjectMapper

class Usuario: Mappable{
    var id : Int = 0
    var nombre : String = ""
    var apellidoPaterno: String = ""
    var apellidoMaterno: String = ""
    var edad : Int = 0
    var correo : String = ""
    var grupos : [Grupo] = []
    var regalos : [Regalo] = []
    var amigoSecreto : Usuario?
    
    init(){
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        self.id <- map["id"]
        self.nombre <- map["nombre"]
        self.apellidoMaterno <- map["apellidoPaterno"]
        self.apellidoPaterno <- map["apellidoMaterno"]
        self.edad <- map["edad"]
        self.correo <- map["correo"]
        self.regalos <- map["regalos"]
        self.grupos <- map["grupos"]
    }
}
