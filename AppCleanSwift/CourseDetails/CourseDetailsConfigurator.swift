//
//  CourseDetailsConfigurator.swift
//  AppCleanSwift
//
//  Created by Igor on 11.04.2022.
//

import Foundation

class CourseDetailsConfigurator {
    static let shared = CourseDetailsConfigurator()
    
    private init() {}
    
    func configure(with viewController: CourseDetailsViewController) {
        let interactor = CourseDetailsInteractor()
        let presenter = CourseDetailsPresenter()
        let router = CourseDetailsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
