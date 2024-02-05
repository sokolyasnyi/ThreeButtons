//
//  CustomButton.swift
//  ThreeButtons
//
//  Created by Станислав Соколов on 04.02.2024.
//

import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupButton() {
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = .systemBlue
        configuration.cornerStyle = .medium
        configuration.image = UIImage(systemName: "arrow.right.circle.fill")
        configuration.imagePadding = 8
        configuration.imagePlacement = .trailing
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        
        self.configuration = configuration
    }
    
    override open func tintColorDidChange() {
        super.tintColorDidChange()
        if tintAdjustmentMode == .dimmed {
            var newConfiguration = self.configuration
            newConfiguration?.background.backgroundColor = .systemGray2
            newConfiguration?.baseForegroundColor = .systemGray3
            configuration = newConfiguration
            titleLabel?.textColor = .systemGray3
            imageView?.tintColor = .systemGray3
        } else {
            var newConfiguration = self.configuration
            newConfiguration?.background.backgroundColor = .systemBlue
            newConfiguration?.baseForegroundColor = .white
            configuration = newConfiguration
        }
    }
    
}
