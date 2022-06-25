//
//  UITableViewExtension.swift
//  BookFinder
//
//  Created by Tophun on 2022/06/26.
//

import UIKit
import SnapKit
import Then

extension UITableView {
    func noResult(_ message: String) {
        let view = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
        let label = UILabel().then {
            $0.font = .systemFont(ofSize: 20, weight: .bold)
            $0.textColor = .secondaryLabel
            $0.textAlignment = .center
            $0.text = message
            $0.numberOfLines = 0
        }
        
        view.addSubview(label)
        label.snp.makeConstraints {
            $0.centerY.equalToSuperview().multipliedBy(0.8)
            $0.leading.trailing.equalToSuperview().inset(40)
        }
        
        self.backgroundView = view
    }
    
    func restore() {
        self.backgroundView = nil
    }
}
