//
//  MainController.swift
//  Intercambio
//
//  Created by ensimerida on 1/14/19.
//  Copyright © 2019 ensimerida. All rights reserved.
//

import UIKit
import CoreStore



class MainController: UIViewController {
    
    var grupos : [Grupo] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        grupos = CoreDataConfig.GruposList
    }
}

extension MainController : UITableViewDelegate{
    
}

extension MainController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return grupos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let entity: Grupo = grupos[indexPath.row];
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = entity.nombre
        return cell!
    }
}
