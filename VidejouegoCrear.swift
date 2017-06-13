//
//  VidejouegoCrear.swift
//  ProyectoDam
//
//  Created by Dam on 25/4/17.
//  Copyright © 2017 Dam. All rights reserved.
//

import UIKit

class VidejouegoCrear: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource, ResponseReceiver  {

    var CategoriaVd: String = ""
    var sliderPunt: Int = 0
    //var controller:VideojuegosTableViewController?
    
    @IBOutlet weak var tfTitulo: UITextField!
    @IBOutlet weak var pickerCategoria: UIPickerView!
    @IBOutlet weak var tfDesarrollador: UITextField!
    @IBOutlet weak var pickerFPublicacion: UIDatePicker!
    @IBOutlet weak var tvDescripcion: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblSlider: UILabel!
    
    let categoriaData = ["Puzzle", "Carreras", "Aventura", "Miesterio", "Accion", "Indie", "Arcade", "shooter"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func sliderPuntuacion(_ sender: UISlider) {
        lblSlider.text = String(Int(sender.value))
        sliderPunt = Int(sender.value)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let selectedPhoto = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image = selectedPhoto
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func selectImageFromPhotoLibraty(_ sender: UITapGestureRecognizer) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController,animated: true, completion: nil)
    }
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoriaData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoriaData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        CategoriaVd = categoriaData[row]
    }
    
    @IBAction func save(_ sender: Any) {
        
        if tfTitulo.text != ""  && tfDesarrollador.text != "" &&  tvDescripcion.text != ""{
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .short
            dateFormatter.timeStyle = .none
            
            let fechaPic = dateFormatter.string(from: pickerFPublicacion.date)
            
            
            
             let diccionario = [ "titulo":"\(self.tfTitulo.text!)", "categoria": "\(self.CategoriaVd)", "desarrollador": "\(self.tfDesarrollador.text!)", "descripcion":"\(self.tvDescripcion.text!)", "fecha": "\(fechaPic)" ,"foto": "", "puntuacion": sliderPunt] as! [String : Any]
           
            //let diccionario = ["titulo": nNombreActividad, "fecha": nFechaActividad, "lugar": lugar.text ?? "Lugar no especificado"
            //    , "horaInicial" : nComienzoActividad, "horaFinal" : nFinActividad, "descripcion" : nDescripcionActividad, "idGrupo" : idGrupo ?? 0, "idProfesor" : idProfe ?? 0] as [String : Any]
            
           // let diccionario = [9, "\(self.tfTitulo.text!)", "\(self.CategoriaVd)", "\(self.tfDesarrollador.text!)", "\(self.tvDescripcion.text!)",  fechaPic ,"",  sliderPunt] as!  [String : Any]
            
            
            //se añade la actividad
            llamadaRestGuardar(diccionario : diccionario)
            
            //se crea el alert
            let correctAlert = UIAlertController(title: "Correcto", message: "El videojuego \(self.tfTitulo.text!) ha sido creado con exito", preferredStyle: UIAlertControllerStyle.alert);
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default){
                (ACTION) in  _ = self.navigationController?.popToRootViewController(animated: true)
                
                
                //se limpia la vista
                self.tfTitulo.text = ""
                //self.tfProfesorAC.text = ""
                self.tfDesarrollador.text = ""
                self.tvDescripcion.text = ""
                
                
            }
            
            correctAlert.addAction(okAction)
            
            self.present(correctAlert, animated: true, completion: nil)
            
            
            
        }else{
            let errorAlert = UIAlertController(title: "Error", message: "No se han rellenado los datos correctamente", preferredStyle: UIAlertControllerStyle.alert);
            
            let errorAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default){
                (ACTION) in print("ok button tapped");
                
            }
            
            errorAlert.addAction(errorAction)
            
            self.present(errorAlert, animated: true, completion: nil)
        }

    }
    
    
    func llamadaRestGuardar(diccionario : [String : Any]){
        guard let cliente = ClienteRest(destino: "videojuego", respuesta: self, "POST", diccionario ) else {
            return
        }
        cliente.request()
        
    }
    
    func onDataReceived(data: Data) {
        
    }
    
    func onErrorReceivingData(message: String) {
        print("Error en la peticion: "+message)
    }
    
}
