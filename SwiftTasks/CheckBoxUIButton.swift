//
//  CheckBoxUIButton.swift
//  SwiftTasks
//
//  Created by Cecilia Reis on 27/05/24.
//

import UIKit

class CheckBoxUIButton: UIButton {
    
    private var isChecked: Bool = false {
        didSet {
            self.updateAppearance()
        }
    }
    
    let checkImage = UIImage(systemName: "check")
    let unCheckImage = UIImage(systemName: "unCheck")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addTarget(self, action:  #selector(toggleChecked), for: .touchUpInside)
        self.updateAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc private func toggleChecked() {
        self.isChecked.toggle()
    }
    
     func updateAppearance() {
        if self .isChecked {
            self.setImage(UIImage(systemName: "check"), for: .normal)
        } else {
            self.setImage(UIImage(systemName: "unCheck"), for: .normal)
        }
    }
    
}

