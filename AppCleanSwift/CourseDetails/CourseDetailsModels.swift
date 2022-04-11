//
//  CourseDetailsModels.swift
//  AppCleanSwift
//
//  Created by Igor on 10.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import Foundation

enum CourseDetails {
 
    // MARK: Use cases
    enum ShowDetails {
        struct Request {
            let course: Course
        }
        
        struct Response {
            // опционалы, так как данные могут не вернуться,
            // а что в этом случае делать, решает presenter
            let courseName: String?
            let lessonsCount: Int?
            let testsCount: Int?
            let imageData: Data?
            let isFavotite: Bool
        }
        
        struct ViewModel {
            let courseName: String
            let lessonsCount: String
            let testsCount: String
            let imageData: Data
            let isFavorite: Bool
        }
    }
    
    enum SetFavoriteStatus {
        // Request нет, так как никакие данные для
        // изменения состояния кнопки не требуются!
        
        struct Response {
            let isFavorite: Bool
        }
        
        struct ViewModel {
            let isFavorite: Bool
        }
    }
}
