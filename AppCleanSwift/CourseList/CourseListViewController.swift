//
//  CourseListViewController.swift
//  AppCleanSwift
//
//  Created by Igor on 11.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol CourseListDisplayLogic: AnyObject {
    func displayCourses(viewModel: CourseList.ShowCourses.ViewModel)
}

class CourseListViewController: UITableViewController {
        
    var interactor: CourseListBusinessLogic?
    var router: (NSObjectProtocol & CourseListRoutingLogic & CourseListDataPassing)?
    
    private var rows: [CourseCellViewModelProtocol] = []
    
    // init не нужны, так как это стартовый экран
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        CourseListConfigurator.shared.configure(with: self)
        title = "Courses"
        
        getCourses()
    }
    
    // MARK: Routing
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    private func getCourses() {
        interactor?.fetchCourses()
    }
}

extension CourseListViewController: CourseListDisplayLogic {
    func displayCourses(viewModel: CourseList.ShowCourses.ViewModel) {
        rows = viewModel.rows
        tableView.reloadData()
    }
}


// MARK: - UITableViewDataSource
extension CourseListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.identifier, for: indexPath) as! CourseListViewCell
        
        cell.viewModel = cellViewModel
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension CourseListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat(rows[indexPath.row].height)
    }
}
