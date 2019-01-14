//
//  Config.swift
//  Intercambio
//
//  Created by ensimerida on 20/12/18.
//  Copyright © 2018 ensimerida. All rights reserved.
//

import Foundation

private let URL_BASE = "https://fccursoswift.000webhostapp.com/api/"

struct ServiceConfig{
    static let listaUsuarios = "\(URL_BASE)usuarios"
    static func login (user: String, pass: String) -> String{
        return "\(URL_BASE)login/user=\(user)&&pass=\(pass)"
    }
    static let registro = "\(URL_BASE)usuarios/add"
}
