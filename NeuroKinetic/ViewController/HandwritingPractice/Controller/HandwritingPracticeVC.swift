//
//  HandwritingPracticeVC.swift
//  NeuroKinetic
//
//  Created by yyonata on 10/24/19.
//  Copyright © 2019 teamRANDY. All rights reserved.
//

import UIKit

class HandwritingPractice: UIViewController {
    
    
    let canvas = CanvasView()
    let undoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Undo", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleUndo), for: .touchUpInside)
        return button
    }()
    
    @objc fileprivate func handleUndo() {
        canvas.undo()
    }
    let clearButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Clear", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleClear), for: .touchUpInside)
        return button
    }()
    @objc func handleClear() {
        canvas.clear()
    }
//    override func loadView() {
//        self.view = canvas
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view.addSubview(canvas)
        canvas.backgroundColor = UIColor(patternImage: UIImage(imageLiteralResourceName: "writingGuideline.png"))
        setupLayout()
    }
    fileprivate func setupLayout() {
        //canvas.frame = view.frame
        let stackView = UIStackView(arrangedSubviews: [
            undoButton,
            clearButton
            ])
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo:
            view.trailingAnchor).isActive = true
    }

    @IBOutlet weak var SentenceBank: UILabel!
    fileprivate func generateSentence(){
        let number = Int.random(in: 0 ..< 10)
        //switch number {
        //case 1:
        //    SentenceBank.text = "The Toronto Raptors"
        //}
    }
    
    
    
}
