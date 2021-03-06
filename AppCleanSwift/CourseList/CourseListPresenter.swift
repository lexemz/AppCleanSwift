//
//  CourseListPresenter.swift
//  AppCleanSwift
//
//  Created by Igor on 11.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

protocol CourseListPresentationLogic {
    func presentCourses(response: CourseList.ShowCourses.Response)
}

class CourseListPresenter: CourseListPresentationLogic {
    
    weak var viewController: CourseListDisplayLogic?
    
    func presentCourses(response: CourseList.ShowCourses.Response) {
        var rows: [CourseCellViewModel] = []
        response.courses.forEach { course in
            rows.append(CourseCellViewModel(course: course))
        }
        let viewModel = CourseList.ShowCourses.ViewModel(rows: rows)
        viewController?.displayCourses(viewModel: viewModel)
    }
}
