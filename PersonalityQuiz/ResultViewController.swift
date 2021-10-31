//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by admin on 30.10.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultDefinitionLabel: UILabel!
    
    var responses: [Answer]
    
    init?(coder: NSCoder, responses: [Answer]) {
        self.responses = responses
        super.init(coder: coder)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true
    }
    
    func calculatePersonalityResult() {
        let frequencyOfAnswers = responses.reduce(into: [:]) {
            (counts, answers) in counts[answers.type, default: 0] += 1
        }
        let frequencyAnswersSorted = frequencyOfAnswers.sorted(by: {(pair1, pair2) in return pair1.value > pair2.value})
        
        let mostCommonAnswer = frequencyAnswersSorted.first!.key
        
        resultAnswerLabel.text = "You are the \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
    }

}
