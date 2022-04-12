//
//  CourseDetailsInteractor.swift
//  AppCleanSwift
//
//  Created by Igor on 10.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

protocol CourseDetailsBusinessLogic {
    func provideCourseDetails()
    func setFavoriteStatus()
}

// свойства для хранения данных, которые нужно подготавливать для передачи в Presenter
// в это свойство передаются данные с другого экрана, в классе Router
protocol CourseDetailsDataStore {
    var course: Course? { get set }
    var isFavorite: Bool { get }
}

class CourseDetailsInteractor: CourseDetailsBusinessLogic, CourseDetailsDataStore {
    
    var presenter: CourseDetailsPresentationLogic?
    var worker: CourseDetailsWorker?
    var course: Course?
    var isFavorite: Bool = false
    
    func provideCourseDetails() {
        worker = CourseDetailsWorker()
        
        isFavorite = worker?.getFavoriteStatus(for: course?.name ?? "") ?? false
        let imageData = worker?.getImageFromNet(withURL: course?.imageUrl)
        
        let response = CourseDetails.ShowDetails.Response(
            courseName: course?.name,
            lessonsCount: course?.numberOfLessons,
            testsCount: course?.numberOfTests,
            imageData: imageData,
            isFavotite: isFavorite
        )
        
        presenter?.presentCourseDetails(response: response)
    }
    
    func setFavoriteStatus() {
        isFavorite.toggle()
        worker?.setFavoriteStatus(
            for: course?.name ?? "",
            with: isFavorite
        )
        
        let response = CourseDetails.SetFavoriteStatus.Response(isFavorite: isFavorite)
        presenter?.presentFavotiteStatus(response: response)
    }
}
