//
//  TaksTableViewCell.swift
//  SwiftTasks
//
//  Created by Cecilia Reis on 27/05/24.
//

import UIKit

class TaksTableViewCell: UITableViewCell {
    
    static let indentifier: String = "TaksTableViewCell"
    
     lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18.0, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupAddSubview()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private func setupAddSubview() {
        addSubview(titleLabel)
    }
    
    private func setupContraints() {
    
        NSLayoutConstraint.activate([
            
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
