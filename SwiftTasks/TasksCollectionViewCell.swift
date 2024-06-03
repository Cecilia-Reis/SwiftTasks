//
//  TasksCollectionViewCell.swift
//  SwiftTasks
//
//  Created by Cecilia Reis on 24/05/24.
//

import UIKit

class TasksCollectionViewCell: UICollectionViewCell {
    
    static let indentifier: String = "TasksCollectionViewCell"

      private lazy var stackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [titleTaskLabel,iconCalendar,iconBell])
        stackview.axis = .vertical
        stackview.isLayoutMarginsRelativeArrangement = true
        stackview.spacing = 40
        stackview.layer.cornerRadius = 20
        stackview.backgroundColor = .pinkApp
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
      }()
    
    private lazy var titleTaskLabel: UILabel = {
        let label = UILabel()
        label.text = "Arte e ilustrações"
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .systemFont(ofSize: 20.0, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
      }()

    private lazy var iconCalendar: UIImageView = {
       let icon = UIImageView()
        icon.image = UIImage(named: "iconCalendar")
        icon.contentMode = .scaleAspectFit
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    private lazy var iconBell: UIImageView = {
       let icon = UIImageView()
        icon.image = UIImage(named: "iconBell")
        icon.contentMode = .scaleAspectFit
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAddSubviews()
        setupContraints()
    }
    
    required init(coder: NSCoder){
        fatalError("init Coder has not been implemented")
    }
    
    private func setupAddSubviews() {
        contentView.addSubview(stackView)
    }
    
    private func setupContraints() {
                
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalToConstant: 180),
            stackView.heightAnchor.constraint(equalToConstant: 180),
            
            titleTaskLabel.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 25),
            titleTaskLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 10),
            titleTaskLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 30),
            
            iconCalendar.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -8),
            iconCalendar.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: -130),
            iconCalendar.widthAnchor.constraint(equalToConstant: 23),
            iconCalendar.heightAnchor.constraint(equalToConstant: 23),
            
            iconBell.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -8),
            iconBell.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: -80),
            iconBell.trailingAnchor.constraint(equalTo: iconCalendar.trailingAnchor, constant: 20),
            iconBell.widthAnchor.constraint(equalToConstant: 23),
            iconBell.heightAnchor.constraint(equalToConstant: 23)
        ])
    }
}
