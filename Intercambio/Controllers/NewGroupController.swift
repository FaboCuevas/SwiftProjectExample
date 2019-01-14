//
//  NewGroupController.swift
//  Intercambio
//
//  Created by ensimerida on 1/14/19.
//  Copyright © 2019 ensimerida. All rights reserved.
//

import UIKit

class NewGroupController: UIViewController {
    
    @IBOutlet weak var nombreTextField: UITextField!
    @IBOutlet weak var montoTextField: UITextField!
    @IBOutlet weak var diaTextField: UITextField!
    @IBOutlet weak var mesTextField: UITextField!
    @IBOutlet weak var anioTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func saveGroup(_ sender: Any) {
        let grupo = Grupo()
        grupo.id = 1
        grupo.nombre = nombreTextField.text!
        grupo.montoMinimo = Int(montoTextField.text!)!
        grupo.fechaIntercambio = "\(diaTextField.text!)-\(mesTextField.text!)-\(anioTextField.text!)"
        CoreDataConfig.addGrupo(grupo)
        navigationController?.popToRootViewController(animated: true)
    }
}
