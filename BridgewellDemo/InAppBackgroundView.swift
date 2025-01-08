//
//  InAppBackgroundView.swift
//  ExampleApp
//
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
            clipsToBounds = true
        }
        get {
            layer.cornerRadius
        }
    }
}

class InAppBackgroundView: UIView {
    
    private(set) lazy var contentView = loadViewFromNib()
    var xibName: String?
    
    init(frame: CGRect, xibName: String?) {
        super.init(frame: frame)
        self.xibName = xibName
        xibSetup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        backgroundColor = .clear
        contentView.frame = bounds
        addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let name = xibName != nil ? xibName! : String(describing: type(of: self))
        return UINib(nibName: name, bundle: bundle).instantiate(withOwner: self, options: nil).first as! UIView
    }
    
}
