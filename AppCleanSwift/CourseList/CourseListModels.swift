//
//  CourseListModels.swift
//  AppCleanSwift
//
//  Created by Igor on 11.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import Foundation

typealias CourseCellViewModel = CourseList.ShowCourses.ViewModel.CourseCellViewModel

protocol CourseCellViewModelProtocol {
    var identifier: String { get }
    var height: Double { get }
    var courseName: String { get }
    var imageData: Data? { get }
    
    init(course: Course)
}

enum CourseList {
 
    // MARK: Use cases
    enum ShowCourses {
        struct Response {
            let courses: [Course]
        }
        
        struct ViewModel {
            struct CourseCellViewModel: CourseCellViewModelProtocol {
                var identifier: String {
                    "CourseCell"
                }
                
                var height: Double {
                    100
                }
                
                var courseName: String {
                    course.name
                }
                
                var imageData: Data? {
                    NetworkManager.shared.fetchImage(url: course.imageUrl)
                }
                
                private let course: Course
                
                init(course: Course) {
                    self.course = course
                }
            }
            
            let rows: [CourseCellViewModelProtocol]
        }
    }
}
