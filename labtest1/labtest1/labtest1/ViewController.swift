//
//  ViewController.swift
//  labtest1
//
//  Created by Umit Kilinc on 2023-02-16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var N1: UILabel!
    @IBOutlet weak var N2: UILabel!
    @IBOutlet weak var N3: UILabel!
    @IBOutlet weak var N4: UILabel!
    @IBOutlet weak var N5: UILabel!
    @IBOutlet weak var N6: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func Draw(_ sender: UIButton) {
        // Generate random lottery numbers
        var lotteryNumbers: [Int] = []
        while lotteryNumbers.count < 6 {
            let randomNumber = Int.random(in: 1...65)
            if !lotteryNumbers.contains(randomNumber) {
                lotteryNumbers.append(randomNumber)
            }
        
        }
        // Update labels with lottery numbers
        N1.text = String(lotteryNumbers[0])
        N2.text = String(lotteryNumbers[1])
        N3.text = String(lotteryNumbers[2])
        N4.text = String(lotteryNumbers[3])
        N5.text = String(lotteryNumbers[4])
        N6.text = String(lotteryNumbers[5])
        }

    }
