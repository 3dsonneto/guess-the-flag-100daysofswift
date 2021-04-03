//
//  ViewController.swift
//  Project2
//
//  Created by Edson Neto on 02/04/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionsAsked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]

        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor //UIColor retorna um UIColor, mas o borderColor não sabe o que é pois está em uma CoreAnimation layer, por isso o .cgColor para converter automaticamente
//        button2.layer.borderColor = UIColor(red: 1.0, green: 0.6, blue: 0.2, alpha: 1.0).cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor

        askQuestion()

    }

    func askQuestion(action: UIAlertAction! = nil){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        
        button1.setImage(UIImage(named: countries[0]), for: .normal) //setImage atribui uma UIImage ao botão,o for: diz qual estado deve mudar, o normal é o estado padrão
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "\(countries[correctAnswer].uppercased()) | SCORE: \(score)"
        questionsAsked += 1
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        let pressed = sender.tag
        if questionsAsked < 10 {
            if sender.tag == correctAnswer {
                title = "Correct"
                score += 1
            } else {
                title = "Wrong! That's the flag of \(countries[pressed].uppercased())"
                score -= 1
            }
            
            let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert) //o estilo é .alert(situation change) ou actionsheet(choose options), alert fica no meio e actionsheet vem de cima e fica
            
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))//o handler procura um closure(codigo que executa quando o botão é executado, nesse caso chama o askQuestion)
            
            present(ac, animated: true)//
        } else {
            title = "The End"
            
            if sender.tag == correctAnswer {
                score += 1
            } else {
                score -= 1
            }
            
            let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert) //o estilo é .alert(situation change) ou actionsheet(choose options), alert fica no meio e actionsheet vem de cima e fica
            
            ac.addAction(UIAlertAction(title: "Play Again", style: .default, handler: askQuestion))//o handler procura um closure(codigo que executa quando o botão é executado, nesse caso chama o askQuestion)
            
            present(ac, animated: true)//
            
            score = 0
            questionsAsked = 0
        }
            
            
    }
    

}

