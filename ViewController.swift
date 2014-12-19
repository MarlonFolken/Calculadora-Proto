//
//  ViewController.swift
//  Calculadora Proto
//
//  Created by Dannah D on 18/12/14.
//  Copyright (c) 2014 Marlon Vargas Contreras. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var etiquetaResultado: UILabel!
    //Array
    var numArray = [Double]()
    //lo desplegado en pantalla
    var mensaje = ""
    //el resultado de operacion mas reciente
    var resultado = ""
    //numero de la operacion, String
    var numStr = ""
    //char, para la operacion vigente
    var simbolo: Character = " "
    //usado como bandera de excepciones
    var ultimaTecla: Character = " "
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //operaciones aritmeticas
    func operame (signo: Character){
        switch signo {
            case "+":
                resultado = "\(numArray[0] + numArray[1])"
            case "-":
                resultado = "\(numArray[0] - numArray[1])"
            case "*":
                resultado = "\(numArray[0] * numArray[1])"
            case "/":
                if numArray[1] == 0.0 { resultado = "0"}
                else {
                    resultado = "\(numArray[0] / numArray[1])"
                }
            default:
            break
        }
    }
    
/***Botones***/
    /**Números**/
    @IBAction func cero() {
        mensaje += "0"
        numStr += "0"
        etiquetaResultado.text = mensaje
        ultimaTecla = "0"
    }
    @IBAction func uno() {
        mensaje += "1"
        numStr += "1"
        etiquetaResultado.text = mensaje
        ultimaTecla = "1"
    }
    @IBAction func dos() {
        mensaje += "2"
        numStr += "2"
        etiquetaResultado.text = mensaje
        ultimaTecla = "2"
    }
    @IBAction func tres() {
        mensaje += "3"
        numStr += "3"
        etiquetaResultado.text = mensaje
        ultimaTecla = "3"
    }
    @IBAction func cuatro() {
        mensaje += "4"
        numStr += "4"
        etiquetaResultado.text = mensaje
        ultimaTecla = "4"
    }
    @IBAction func cinco() {
        mensaje += "5"
        numStr += "5"
        etiquetaResultado.text = mensaje
        ultimaTecla = "5"
    }
    @IBAction func seis() {
        mensaje += "6"
        numStr += "6"
        etiquetaResultado.text = mensaje
        ultimaTecla = "6"
    }
    @IBAction func siete() {
        mensaje += "7"
        numStr += "7"
        etiquetaResultado.text = mensaje
        ultimaTecla = "7"
    }
    @IBAction func ocho() {
        mensaje += "8"
        numStr += "8"
        etiquetaResultado.text = mensaje
        ultimaTecla = "8"
    }
    @IBAction func nueve() {
        mensaje += "9"
        numStr += "9"
        etiquetaResultado.text = mensaje
        ultimaTecla = "9"
    }
    @IBAction func punto() {
        mensaje += "."
        numStr += "."
        etiquetaResultado.text = mensaje
        ultimaTecla = "."
    }
    
    /**Signos**/
    @IBAction func signoSuma() {
        //evita redundancia de pulsacion de tecla
        if ultimaTecla != "+" {
            //Guarda cifra anterior
            numArray.append(strtod(numStr,nil))
            if numArray.count == 2{
                operame(simbolo)
                mensaje = resultado + "+"
                numArray = []
                numArray.append(strtod(resultado,nil))
                numStr = ""
            } else {
                mensaje += "+"
            }
            numStr = ""
            simbolo = "+"
            ultimaTecla = "+"
            etiquetaResultado.text = mensaje
        }
    }
    @IBAction func signoResta() {
        if ultimaTecla != "-" {
            //Guarda cifra anterior
            numArray.append(strtod(numStr,nil))
            if numArray.count == 2{
                operame(simbolo)
                mensaje = resultado + "-"
                numArray = []
                numArray.append(strtod(resultado,nil))
                numStr = ""
            } else {
                mensaje += "-"
            }
            numStr = ""
            simbolo = "-"
            ultimaTecla = "-"
            etiquetaResultado.text = mensaje
        }
    }
    @IBAction func signoMultiplicacion() {
        if ultimaTecla != "*" {
            //Guarda cifra anterior
            numArray.append(strtod(numStr,nil))
            if numArray.count == 2{
                operame(simbolo)
                mensaje = resultado + "*"
                numArray = []
                numArray.append(strtod(resultado,nil))
                numStr = ""
            } else {
                mensaje += "*"
            }
            numStr = ""
            simbolo = "*"
            ultimaTecla = "*"
            etiquetaResultado.text = mensaje
        }
    }
    @IBAction func signoDivision() {
        if ultimaTecla != "/" {
            //Guarda cifra anterior
            numArray.append(strtod(numStr,nil))
            if numArray.count == 2{
                operame(simbolo)
                mensaje = resultado + "/"
                numArray = []
                numArray.append(strtod(resultado,nil))
                numStr = ""
            } else {
                mensaje += "/"
            }
            numStr = ""
            simbolo = "/"
            ultimaTecla = "/"
            etiquetaResultado.text = mensaje
        }
    }
    
    /**resultado**/
    @IBAction func signoIgual() {
        if ultimaTecla != "="{
            switch ultimaTecla {
                case "+","-","*","/":
                    break
                default:
                    numArray.append(strtod(numStr,nil))
                    if numArray.count == 2 {
                        operame(simbolo)
                        numArray = []
                        numArray.append(strtod(resultado,nil))
                        numStr = ""
                    }
            }
            mensaje = resultado
            numStr = ""
            simbolo = " "
            ultimaTecla = "="
            etiquetaResultado.text = mensaje
        }
    }
    
    /**limpiar o clear**/
    @IBAction func btnClear() {
        numArray = []
        mensaje = ""
        resultado = ""
        numStr = ""
        simbolo = " "
        ultimaTecla = " "
        etiquetaResultado.text = mensaje
    }
}

