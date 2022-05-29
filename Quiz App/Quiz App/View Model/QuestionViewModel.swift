//
//  QuestionViewModel.swift
//  Quiz App
//
//  Created by MD Tarif khan on 14/4/22.
//

import Foundation

class QuestionViewModel {
    
    var questionData: DataModel?
    private let sourceUrl = URL(string: "https://quiz-68112-default-rtdb.firebaseio.com/quiz.json")!
    
    func apiToGetQuestionData(completion: @escaping() -> ()) {
        URLSession.shared.dataTask(with: sourceUrl) { [weak self] (data, urlResponse, error) in
            if let data = data{
                
                let jsonDecoder = JSONDecoder()
                
                let empData = try! jsonDecoder.decode(DataModel.self, from: data)
                print(empData)
                self?.questionData = empData
                completion()
            }
        }.resume()
    }
}
