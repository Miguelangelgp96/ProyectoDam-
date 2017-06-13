//
//  DetallesVideojuegos.swift
//  ProyectoDam
//
//  Created by Dam on 4/4/17.
//  Copyright © 2017 Dam. All rights reserved.
//

import UIKit

class DetallesVideojuegos: UIViewController {

    var detalles: Videojuego!
    
    
    @IBOutlet weak var lblTitulo: UILabel!
    @IBOutlet weak var lblCategoria: UILabel!
    @IBOutlet weak var lblFLanzamiento: UILabel!
    @IBOutlet weak var lblDesarrollador: UILabel!
    @IBOutlet weak var txtvDescripcion: UITextView!
    @IBOutlet weak var lblPuntuacion: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.lblTitulo.text = detalles.titulo
        self.lblPuntuacion.text = String(detalles.puntuacion)
        self.lblCategoria.text = detalles.categoria
        self.lblFLanzamiento.text = detalles.fecha
        self.lblDesarrollador.text = detalles.desarrollador
        self.txtvDescripcion.text = detalles.descripcion
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
