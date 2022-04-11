//
//  CourseListInteractor.swift
//  AppCleanSwift
//
//  Created by Igor on 11.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

protocol CourseListBusinessLogic {
    func doSomething(request: CourseList.Something.Request)
}

protocol CourseListDataStore {
    
}

class CourseListInteractor: CourseListBusinessLogic, CourseListDataStore {
    
    var presenter: CourseListPresentationLogic?
    var worker: CourseListWorker?
    
    func doSomething(request: CourseList.Something.Request) {
        worker = CourseListWorker()
        worker?.doSomeWork()
        
        let response = CourseList.Something.Response()
        presenter?.presentSomething(response: response)
    }
}