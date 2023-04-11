//
//  ViewController.swift
//  ex5
//
//  Created by Umit Kilinc on 2023-04-11.
//

import UIKit

class ViewController: MyTableTableViewController {

    @IBOutlet weak var label: UILabel!
    
    var country:Country! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label.text = country.name
    }


}

