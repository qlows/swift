//
//  ViewController.swift
//  lab3
//
//  Created by Umit Kilinc on 2023-02-05.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var btnIncreaseStep: UIButton!
    var counter = 0
    var step = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        label.text = "\(counter)"
    }
    
    @IBAction func addOne(_ sender: UIButton) {
        counter += step
        label.text = "\(counter)"
    }
    
    @IBAction func minusOne(_ sender: UIButton) {
        counter -= step
        label.text = "\(counter)"
    }
    
    @IBAction func clear(_ sender: UIButton) {
        counter = 0
        step = 1
        label.text = "\(counter)"
        btnIncreaseStep.setTitle("Increase step (\(step))", for: .normal)
    }
    
    
    @IBAction func increaseStep(_ sender: UIButton) {
        step += 1
        sender.setTitle("Increase step (\(step))", for: .normal)
    }
}

