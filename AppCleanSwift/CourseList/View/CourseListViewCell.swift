//
//  CourseTableViewCell.swift
//  AppMVVM
//
//  Created by Igor on 22.02.2022.
//

import UIKit

protocol CellModelRepresentable {
    var viewModel: CourseCellViewModelProtocol? { get }
}

class CourseListViewCell: UITableViewCell, CellModelRepresentable {
    var viewModel: CourseCellViewModelProtocol? {
        didSet {
            updateView()
        }
    }
    
    private func updateView() {
        guard let viewModel = viewModel as? CourseCellViewModel else { return }
        var content = defaultContentConfiguration()
        
        content.text = viewModel.courseName
        
        if let imageData = viewModel.imageData {
            content.image = UIImage(data: imageData)
        }

        contentConfiguration = content
    }
}
