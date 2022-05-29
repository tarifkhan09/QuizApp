//
//  ViewController.swift
//  Quiz App
//
//  Created by MD Tarif khan on 4/4/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var onClickOpen: UIButton!{
        didSet{
            onClickOpen.layer.cornerRadius = onClickOpen.frame.height/2
        }
    }
    @IBOutlet weak var onClickTopics: UIButton!{
        didSet{
            onClickTopics.layer.cornerRadius = onClickTopics.frame.height/2
        }
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    
    @IBAction func onClickOpen(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "QuizViewController") as? QuizViewController else {return}
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func onClickTopics(_ sender: Any) {
    }
    
    
    
}


