//
//  QuizCollectionViewCell.swift
//  Quiz App
//
//  Created by MD Tarif khan on 15/5/22.
//

import UIKit

enum SelectedOption {
    case optionA
    case optionB
    case optionC
    case optionD
}




class QuizCollectionViewCell: UICollectionViewCell {
    
    ///outlet
    
    @IBOutlet weak var questionLable: UILabel!
    @IBOutlet weak var option1: UILabel!
    @IBOutlet weak var option2: UILabel!
    @IBOutlet weak var option3: UILabel!
    @IBOutlet weak var option4: UILabel!
    
    @IBOutlet weak var optionA: UIControl!
    @IBOutlet weak var optionB: UIControl!
    @IBOutlet weak var optionC: UIControl!
    @IBOutlet weak var optionD: UIControl!
    
    
    private var correctAnswer : String?
    var setVlue: Questions? {
        didSet{
            questionLable.text = setVlue?.question
            option1.text = setVlue?.option_1
            option2.text = setVlue?.option_2
            option3.text = setVlue?.option_3
            option4.text = setVlue?.option_4
            
            correctAnswer = setVlue?.correct_answer
        }
    }
    
    override func prepareForReuse() {
        updateBorder(myView: optionA)
        updateBorder(myView: optionB)
        updateBorder(myView: optionC)
        updateBorder(myView: optionD)
    }
    
    var selectedOption: ((_ selectedAnswer: Bool) -> Void)?
    
    @IBAction func onClickOptionA(_ sender: Any) {
        var isCorrect = false
        if correctAnswer == setVlue?.option_1{
            isCorrect = true
        }
        selectedOption!(isCorrect)
        
        changeBorder(selectedOption: .optionA)
    }
    
    
    @IBAction func onClickOptionB(_ sender: Any) {
        var isCorrect = false
        if correctAnswer == setVlue?.option_2{
            isCorrect = true
        }
        selectedOption!(isCorrect)
        
        changeBorder(selectedOption: .optionB)
    }
    
    
    
    @IBAction func onClickOptionC(_ sender: Any) {
        var isCorrect = false
        if correctAnswer == setVlue?.option_3{
            isCorrect = true
        }
        selectedOption!(isCorrect)
        
        changeBorder(selectedOption: .optionC)
    }
    
    
    @IBAction func onClickOptionD(_ sender: Any) {
        
        var isCorrect = false
        if correctAnswer == setVlue?.option_4{
            isCorrect = true
        }
        selectedOption!(isCorrect)
        
        changeBorder(selectedOption: .optionD)
    }
    
    func changeBorder(selectedOption: SelectedOption){
        switch selectedOption{
        case .optionA:
            updateBorder(myView: optionA, borderWidth: 4)
            updateBorder(myView: optionB)
            updateBorder(myView: optionC)
            updateBorder(myView: optionD)
            
            
        case .optionB:
            updateBorder(myView: optionB, borderWidth: 4)
            updateBorder(myView: optionA)
            updateBorder(myView: optionC)
            updateBorder(myView: optionD)
            
        case .optionC:
            updateBorder(myView: optionC, borderWidth: 4)
            updateBorder(myView: optionB)
            updateBorder(myView: optionA)
            updateBorder(myView: optionD)
            
        case .optionD:
            updateBorder(myView: optionD, borderWidth: 4)
            updateBorder(myView: optionB)
            updateBorder(myView: optionC)
            updateBorder(myView: optionA)
        }
    }
    
    
    func updateBorder(myView: UIView, borderWidth: CGFloat = 0){
        myView.layer.borderWidth = borderWidth
        myView.layer.borderColor = UIColor.white.cgColor
    }
    
}
