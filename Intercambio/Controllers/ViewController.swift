//
//  ViewController.swift
//  Intercambio
//
//  Created by ensimerida on 20/12/18.
//  Copyright © 2018 ensimerida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func successHandler(_ usuario: Usuario) -> Void {
        Loader.sharedInstance.hide()
        performSegue(withIdentifier: "SHOW_MAIN", sender: self)
    }
    
    func errorHandler(_ msg: String) -> Void {
        Loader.sharedInstance.hide()
        show(message: msg)
    }
    
    @IBAction func login(_ sender: Any) {
        if validate() {
            Loader.sharedInstance.show()
            DispatchQueue.main.async(execute: { () -> Void in
                APIUsuarios.Login(self.userTextField.text!, self.passTextField.text!, success: self.successHandler(_:), fail: self.errorHandler(_:))
            })
        }
    }
    
    func validate() -> Bool{
        if self.userTextField.text == ""{
            show(message: "Campo Usuario es requerido")
            return false
        }
        if self.passTextField.text == ""{
            show(message: "Campo Contraseña es requerido")
            return false
        }
        return true
    }
}

