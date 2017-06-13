//
//  VideojuegoCell.swift
//  ProyectoDam
//
//  Created by Dam on 4/4/17.
//  Copyright © 2017 Dam. All rights reserved.
//

import UIKit

class VideojuegoCell: UITableViewCell {

    
    @IBOutlet var imageCell: UIImageView!
    @IBOutlet weak var lblTituloCell: UILabel!
    @IBOutlet weak var lblCategoriaCell: UILabel!
    @IBOutlet weak var lblFPublicacion: UILabel!

    var videojuego: Videojuego!{
        didSet {
            self.lblTituloCell.text = videojuego.titulo
            self.lblFPublicacion.text = videojuego.fecha
            self.lblCategoriaCell.text = videojuego.categoria
            self.imageCell.image = UIImage(named: videojuego.foto!)
        }
    }
    
}
