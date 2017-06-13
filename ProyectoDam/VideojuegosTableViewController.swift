//
//  TableViewController.swift
//  ProyectoDam
//
//  Created by Dam on 4/4/17.
//  Copyright © 2017 Dam. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, ResponseReceiver {

    var videojuegos = [Videojuego]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cliente = ClienteRest(destino: "videojuego", respuesta: self)
        cliente?.request()
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewWillAppear(_ animated: Bool) {
        NSLog("AQUI: viewWillAppear");
        self.tableView.reloadData()
        

    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return videojuegos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! VideojuegoCell
        
        
        let vid = videojuegos[indexPath.row] as Videojuego
        cell.lblTituloCell.text = vid.titulo
        cell.lblCategoriaCell.text = vid.categoria
        cell.lblFPublicacion.text = vid.fecha
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
            videojuegos.remove(at: indexPath.row)
            tableView.reloadData()
            
        }
	}
    
    func onDataReceived(data: Data) {
        self.videojuegos = Util.listadoVideojuegos(Datos: data)!
        self.tableView.reloadData()
        
        print(self.videojuegos);
    }
    
    func onErrorReceivingData(message: String) {
        print("Error en la peticion: "+message)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detallesVid"{
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let detallesViewController = segue.destination as! DetallesVideojuegos
                detallesViewController.detalles = videojuegos[indexPath.row]
            }
        }
    }
    
}
