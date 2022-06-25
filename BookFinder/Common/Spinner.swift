//
//  Spinner.swift
//  BookFinder
//
//  Created by Tophun on 2022/06/26.
//

import UIKit

final class Spinner {
    class func show() {
        DispatchQueue.main.async {
            guard let window = UIApplication.shared.windows.last else { return }
            
            let activityIndicator: UIActivityIndicatorView
            if let existedView = window.subviews.first(where: { $0 is UIActivityIndicatorView } ) as? UIActivityIndicatorView {
                activityIndicator = existedView
            
            } else {
                activityIndicator = UIActivityIndicatorView(style: .large)
                activityIndicator.frame = window.frame
                activityIndicator.color = .lightGray
                window.addSubview(activityIndicator)
            }
            
            activityIndicator.startAnimating()
        }
    }
    
    class func hidden() {
        DispatchQueue.main.async {
            guard let window = UIApplication.shared.windows.last else { return }
            window.subviews.filter({ $0 is UIActivityIndicatorView }).forEach { $0.removeFromSuperview() }
        }
    }
}
