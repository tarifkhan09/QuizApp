//
//  ResultViewController.swift
//  Quiz App
//
//  Created by MD Tarif khan on 15/5/22.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var reusltLable: UILabel!
    
    var result = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reusltLable.text = "\(result)"
        // Do any additional setup after loading the view.
    }
    


    @IBAction func backToHome(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
