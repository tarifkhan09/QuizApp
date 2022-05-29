//
//  QuizViewController.swift
//  Quiz App
//
//  Created by MD Tarif khan on 15/5/22.
//

import UIKit

class QuizViewController: UIViewController {
    
    ///variable
    var viewModel = QuestionViewModel()
    var questionData: [Questions]?
    var answerSelected = false
    var isCorrectAnswer = false
    var point = 0
    var index = 0
    
    ///outlet
    @IBOutlet weak var quizCollectionView: UICollectionView!
    @IBOutlet weak var exit: UIButton!{
        didSet{
            exit.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var nextBtn: UIButton!{
        didSet{
            nextBtn.layer.cornerRadius = 10
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.apiToGetQuestionData { [weak self] in
            self?.questionData = self?.viewModel.questionData?.data?.questions
            DispatchQueue.main.async {
                
                self?.quizCollectionView.delegate = self
                self?.quizCollectionView.dataSource = self
                self?.quizCollectionView.reloadData()
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
    ///Action
    @IBAction func onClickExit(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func onClickNext(_ sender: Any) {
        if !answerSelected{
            ///show alert
            let alert = UIAlertController(title: "Select One option!", message: "Please select one option before moving the next question", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true)
            return
        }
        answerSelected = false
        if isCorrectAnswer{
            point += 1
        }
        if index<(self.questionData?.count ?? 0) - 1 {
            index += 1
            
            quizCollectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: .right, animated: true)
        }
        else{
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else {return}
            vc.result = point
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}



extension QuizViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questionData?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = quizCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? QuizCollectionViewCell else { return QuizCollectionViewCell()}
        
        cell.setVlue = questionData?[indexPath.row]
        cell.optionA.layer.cornerRadius = 10
        cell.optionB.layer.cornerRadius = 10
        cell.optionC.layer.cornerRadius = 10
        cell.optionD.layer.cornerRadius = 10
        cell.selectedOption = { [ weak self ] isCorrect in
            self?.answerSelected = true
            self?.isCorrectAnswer = isCorrect
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: quizCollectionView.frame.width, height: quizCollectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
}
