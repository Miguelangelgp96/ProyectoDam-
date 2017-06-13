//
//  Util.swift
//  ProyectoDam
//
//  Created by Dam on 2/5/17.
//  Copyright © 2017 Dam. All rights reserved.
//

import Foundation

class Util {
    

    static func listadoVideojuegos (Datos: Data)->Array<Videojuego>?{
        var listado: [Videojuego] = []
        do {
            guard let respuesta = try JSONSerialization.jsonObject(with: Datos, options: []) as?
                [Any] else {
                    print("error json")
                    return nil
            }
            guard let videojuego = respuesta as?[[String: Any]] else {
                print("error Videojuego")
                return nil
            }
            
            for i in 0 ..< videojuego.count {
                let p = Videojuego(videojuego[i])
                
                listado.append(p)
                print(i, p)
            }
        } catch {
            print ("fallo")
        }
        
        return listado
    }
}

/*
static func dictToJson(data: [String:Any]) -> Data? {
    guard let json = try? JSONSerialization.data(withJSONObject: data as Any,
                                                 options: []) else {
                                                    return nil
    }
    return json
}

static func jsonToDict(data: Data) -> [[String: Any]]? {
    guard let diccionario = try? JSONSerialization.jsonObject(with: data, options: [])
        as? [[String: Any]] else {
            return nil
    }
    return diccionario
}


static func getArrayActividadFromJson(diccionario: [[String : Any]]) -> [Actividad] {
    var actividades: [Actividad] = []
    /*guard let diccionarioActividades = diccionario["actividades"] as?[[String: Any]] else {
     return actividades
     }*/
    for diccionarioActividad in diccionario {
        actividades.append(Actividad(diccionarioActividad))
    }
    return actividades
}*/

