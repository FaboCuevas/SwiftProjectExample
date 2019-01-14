//
//  Config.swift
//  Intercambio
//
//  Created by ensimerida on 1/14/19.
//  Copyright © 2019 ensimerida. All rights reserved.
//

import Foundation
import CoreStore

struct CoreDataConfig {
    
    static let conectionStack : DataStack = {
        let dataStack = DataStack(xcodeModelName: "Intercambio")
        try! dataStack.addStorageAndWait(
            SQLiteStore(
                fileName: "Intercambio.sqlite",
                localStorageOptions: .recreateStoreOnModelMismatch
            )
        )
        return dataStack
    }()
    
    static let GruposList: [Grupo] = {
        let list = conectionStack.fetchAll(From<Grupo_CD>())
        var returnList : [Grupo] = []
        for item in list!{
            var grupo = Grupo()
            grupo.id = Int(item.id)
            grupo.nombre = item.nombre!
            returnList.append(grupo)
        }
        return returnList
    }()
    
    static func addGrupo(_ grupo: Grupo) -> Void {
        _ = try? conectionStack.perform(
            synchronous: {
                (transaction) in
                let create = transaction.create(Into<Grupo_CD>())
                create.fecha = DateFormatter(withFormat: "dd-MM-yyyy", locale: "UTC").date(from: grupo.fechaIntercambio)
                create.monto = Double(grupo.montoMinimo)
                create.nombre = grupo.nombre
            }
        )
    }
}
