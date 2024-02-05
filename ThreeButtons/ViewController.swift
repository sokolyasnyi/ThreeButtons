//
//  ViewController.swift
//  ThreeButtons
//
//  Created by Станислав Соколов on 04.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    
    lazy private var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    lazy private var firstButton: CustomButton = {
        let button = CustomButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("First Button", for: .normal)
        return button
    }()

    lazy private var secondButton: CustomButton = {
        let button = CustomButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Second Medium Button", for: .normal)
        return button
    }()
    
    lazy private var thirdButton: CustomButton = {
        let button = CustomButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Third", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
        setupConstraints()
    }

    func setupView() {
        view.addSubview(containerStackView)
        containerStackView.addArrangedSubview(firstButton)
        containerStackView.addArrangedSubview(secondButton)
        containerStackView.addArrangedSubview(thirdButton)
        
        firstButton.addTarget(self, action: #selector(scaleDown), for: [.touchDown, .touchDragExit])
        firstButton.addTarget(self, action: #selector(scaleUp), for: [.touchUpInside, .touchDragExit, .touchCancel])
        
        secondButton.addTarget(self, action: #selector(scaleDown), for: [.touchDown, .touchDragExit])
        secondButton.addTarget(self, action: #selector(scaleUp), for: [.touchUpInside, .touchDragExit, .touchCancel])
        
        thirdButton.addTarget(self, action: #selector(scaleDown), for: [.touchDown, .touchDragExit])
        thirdButton.addTarget(self, action: #selector(scaleUp), for: [.touchUpInside, .touchDragExit, .touchCancel])
        thirdButton.addTarget(self, action: #selector(showModalViewController), for: .touchUpInside)
    
    }

    
    func setupConstraints() {
        containerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        containerStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 72).isActive = true
        containerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        
    }
    
    
    @objc private func scaleDown(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 3,
                       options: [.allowUserInteraction, .beginFromCurrentState]) {
            sender.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }
    }
    
    @objc private func scaleUp(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 3) {
            sender.transform = .identity
        }
    }
    
    @objc private func showModalViewController() {
        let modalViewController = ModalViewController()
        modalViewController.modalTransitionStyle = .coverVertical
        modalViewController.modalPresentationStyle = .pageSheet
        self.present(modalViewController, animated: true)
    }
    
}

