//
//  MainViewController.swift
//  BridgewellDemo
//
//

import UIKit

extension UIViewController {
    
    func setNavigationBar() {
        setNavbarLogo()
        setBackBarButton()
    }
    
    func setNavbarLogo() {
        let logo = UIImage(named: "LOGO")
        let imageView = UIImageView(image: logo)
        imageView.contentMode = .scaleAspectFit
        
        let logoWidth: CGFloat = 180
        let logoHeight: CGFloat = 28
        imageView.frame = CGRect(x: 0, y: 0, width: logoWidth, height: logoHeight)
        
        navigationItem.titleView = imageView
    }
    
    func setBackBarButton() {
        // Create the custom back button as a UIButton
        let backButton = UIButton(type: .system)
        backButton.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        backButton.tintColor = .gray
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        // Adjust the button size if needed
        backButton.frame = CGRect(x: 0, y: 0, width: 35, height: 30)
        
        // Wrap the button in a UIBarButtonItem
        let barButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = barButtonItem
    }
    
    @objc private func backButtonTapped() {
        // Handle back button tap
        navigationController?.popViewController(animated: true)
    }
}

class MainViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavbarLogo()
    }
    
}
