//
//  MainCoordinator.swift
//  PostTestTask
//
//  Created by Igor Poliukhovych on 23.11.2022.
//

import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = UserHomeViewController()
        vc.coordinator = self
        vc.viewModel = UserHomeViewModel()
        navigationController.pushViewController(vc, animated: true)
    }
}
