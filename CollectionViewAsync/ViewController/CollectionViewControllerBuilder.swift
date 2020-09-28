//
//  CollectionViewControllerBuilder.swift
//  CollectionViewAsync
//
//  Created by kohei yoshida on 2020/09/28.
//

import Foundation
import UIKit

protocol CollectionViewControllerBuilderProtocol{
    
    associatedtype viewController: UIViewController
    static func build() -> viewController
    
}

struct CollectionViewControllerBuilder:CollectionViewControllerBuilderProtocol{
    typealias viewController = CollectionViewController
    
    static func build() -> CollectionViewController {
        // Viewに関する部品
        let viewController = CollectionViewController()
        let dataSource = CollectionViewDataSource()
        let repository = APIRepository(output: <#T##APIRepositoryOutput#>)
        let presenter = CollectionViewModel(input: <#T##ModelInputPort#>, output: <#T##ViewModelOutputPort#>)
        let usecase = CollectionModel(output: <#T##ModelOutputPort#>, input: <#T##APIRepositoryInput#>)
    }
    
    
}
