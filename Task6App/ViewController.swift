//
//  ViewController.swift
//  Task6App
//
//  Created by 山崎喜代志 on 2021/03/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var randomLabel: UILabel!
    @IBOutlet private weak var numSlider: UISlider!

    private var answer: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       retry()
    }

    private func showAlert(message: String) {
        let alert = UIAlertController(title: "結果",
                                      message: message,
                                      preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "再挑戦",
                                      style: .default,
                                      handler: { [weak self](_) in
                                        self?.retry()
                                      })
        )
        present(alert, animated: true, completion: nil)
    }

    @IBAction private func onJudge(_ sender: Any) {
        let sliderValue = Int(numSlider.value)
        let firstLine = answer == sliderValue ? "当たり!" : "はずれ!"
        showAlert(message: "\(firstLine)\nあなたの数\(sliderValue)")
    }

    private func makeAnswer() -> Int {
        Int(arc4random_uniform(100)) + 1
    }

    private func updateRamdomLabel() {
        randomLabel.text = String(answer)
    }

    private func retry() {
        answer = makeAnswer()
        updateRamdomLabel()

        numSlider.value = 50
    }
}
