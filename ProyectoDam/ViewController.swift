//
//  ViewController.swift
//  ProyectoDam
//
//  Created by Dam on 4/4/17.
//  Copyright © 2017 Dam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var i = 0
    
    @IBAction func bt2(_ sender: UIButton) {
        guard let cliente = ClienteRest(destino: "videojuego", respuesta: self as! ResponseReceiver) else{
            return
        }
        
        if cliente.request(){
            print("todo bien")
        }
    }
    
    
    @IBOutlet weak var tv: UITextView!
    @IBAction func threadBt(_ sender: UIButton){
        let url = "https://damswift-videogames-miguelangel96.c9users.io/ios"
        
        let cola = DispatchQueue(label: "cola", attributes: .concurrent)
        cola.async {
            //tv.text = download("url")
            let s = self.download(_url: url)
            //s esta la pagina
            DispatchQueue.main.async {
                self.tv.text = s
            }
        }
        tv.text = "ok"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func download(_url: String)-> String{
        if let url = URL(string: "https://www.example.com"){
            
            do{
                let contenido = try String(contentsOf: url)
                return contenido
            } catch {
                return "No se ha podido descargar"
            }
        } else {
            return "La URL está mal"
        }
    }
    func onDataReceived(data: Data) {
        print ("Todo ha ido bien")
    }
    
    
    func onErrorReceivingData(message: String) {
        print ("Todo ha ido Mal")
    }

    

}

