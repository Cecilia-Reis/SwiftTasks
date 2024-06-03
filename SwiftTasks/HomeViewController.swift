//
//  ViewController.swift
//  SwiftTasks
//
//  Created by Cecilia Reis on 21/05/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var logoImage: UIImageView = {
        let imageView = UIImageView(image: UIImage.logo)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Organize suas tarefas e ideias de forma rápida e eficiente."
        label.font = .systemFont(ofSize: 30.0, weight: .semibold)
        return label
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("➜", for: .normal)
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var lampImage: UIImageView = {
        let imageView = UIImageView(image: UIImage.lamp)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupAddSubview()
        setupContraints()
    }
                         
 @objc private func buttonPressed() {
            navigationController?.pushViewController(TasksViewController(), animated: true)
        }
    
    private func setupAddSubview() {
        view.addSubview(logoImage)
        view.addSubview(titleLabel)
        view.addSubview(startButton)
        view.addSubview(lampImage)
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            logoImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            logoImage.widthAnchor.constraint(equalToConstant: 350),
            logoImage.heightAnchor.constraint(equalToConstant: 350),
            
            titleLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 45),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 15),
            
            startButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            startButton.widthAnchor.constraint(equalToConstant: 60),
            startButton.heightAnchor.constraint(equalToConstant: 50),
            
            lampImage.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 125),
            lampImage.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 140),
            lampImage.widthAnchor.constraint(equalToConstant: 60),
            lampImage.heightAnchor.constraint(equalToConstant: 60),
            
        ])
    }

}

