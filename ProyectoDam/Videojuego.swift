//
//  Videojuego.swift
//  ProyectoDam
//
//  Created by Dam on 4/4/17.
//  Copyright © 2017 Dam. All rights reserved.
//

import Foundation

class Videojuego{
    
    var id: Int
    var titulo: String?
    var categoria: String?
    var desarrollador: String?
    var descripcion: String?
    var fecha: String?
    var foto:  String?
    var puntuacion: Int!
    
    
    init() {
        id = 0
        titulo = ""
        categoria = ""
        desarrollador = ""
        descripcion = ""
        fecha = ""
        foto = ""
        puntuacion = 0
        
    }
    
    init(_ id : Int, titulo: String?, categoria: String?, desarrollador: String?, descripcion: String?, fecha: String?, foto: String?, puntuacion: Int!) {
        self.id = id
        self.titulo = titulo
        self.categoria = categoria
        self.desarrollador = desarrollador
        self.descripcion = descripcion
        self.fecha = fecha
        self.foto = foto
        self.puntuacion = puntuacion
    }
    
    
    // MIGUEL FUNCION DIFERENTE
    init(_ array: [String: Any]){
        self.id = (array["id"] as! NSString).integerValue // Esta linea es diferente
        self.titulo = array["titulo"] as? String
        self.categoria = array["categoria"] as? String
        self.desarrollador = array["desarrollador"] as? String
        self.descripcion = array["descripcion"] as? String
        self.fecha = array["fecha"] as? String
        self.foto = array["foto"] as? String
        self.puntuacion = (array["puntuacion"] as! NSString).integerValue // Esta linea es diferente
    }
    
}
