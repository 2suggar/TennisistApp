//
//  MainViewController.swift
//  TennisistApp
//
//  Created by Ekaterina Akulina on 29.04.2021.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

    private let backgroundImageView = UIImageView()
    
    private let VC = ProfileViewController()
    
    private let transition = PanelTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        VC.transitioningDelegate = transition
        VC.modalPresentationStyle = .custom

        present(VC, animated: true)
    }
    
    // MARK: Private functions
    private func setupUI() {
        backgroundImageView.image = UIImage(named: "background")
        backgroundImageView.contentMode = .scaleAspectFill
        
        view.addSubview(backgroundImageView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}


class PanelTransition: NSObject, UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        PresentationController(presentedViewController: presented,presenting: presenting ?? source)
    }
}


class PresentationController: UIPresentationController {
    override var frameOfPresentedViewInContainerView: CGRect {
        let bounds = containerView!.bounds
        let height = bounds.height * 0.75
        let y = bounds.height * 0.25
        return CGRect(x: 0,
                      y: y,
                      width: bounds.width,
                      height: height)
    }
    
    
    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        containerView?.addSubview(presentedView!)
    }
    
    override func containerViewDidLayoutSubviews() {
        super.containerViewDidLayoutSubviews()
        presentedView?.frame = frameOfPresentedViewInContainerView
    }
}
