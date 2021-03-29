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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        randomLabel.text = String(arc4random_uniform(101))
        numSlider.value = 50
    }

    private func showAlert(message: String) {
        let alert = UIAlertController(title: "結果",
                                      message: message,
                                      preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "再挑戦",
                                      style: .default,
                                      handler: { (_) in
                                        self.randomLabel.text = String(arc4random_uniform(101))
                                        self.numSlider.setValue(50, animated: false)
                                      })
        )
        present(alert, animated: true, completion: nil)
    }

    @IBAction private func onJudge(_ sender: Any) {
        let labelNum = Int(randomLabel.text!)
        let sliderNumForInt = Int(numSlider.value)
        labelNum == sliderNumForInt ? showAlert(message: "当たり!\nあなたの数\(sliderNumForInt)")
                                    : showAlert(message: "はずれ!\nあなたの数\(sliderNumForInt)")
    }

}
