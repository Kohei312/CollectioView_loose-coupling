//
//  CollectionViewControllerBuilder.swift
//  CollectionViewAsync
//
//  Created by kohei yoshida on 2020/09/28.
//

import Foundation
import UIKit

protocol CollectionViewControllerBuilderProtocol{
    
    static func build()
}

struct CollectionViewControllerBuilder:CollectionViewControllerBuilderProtocol{

    
    static func build()-> CollectionViewController{
        // VC
        let viewController = CollectionViewController()
//            viewController.collectionView.register(CollectionViewCell.self)
//
        // View
        let dataSource = CollectionViewDataSource(input: <#ViewModelInputPort#>)
        // repository
        let repository = APIRepository(output: <#T##APIRepositoryOutput#>)
        
        // presenter
        let presenter = CollectionViewModel(input: <#T##ModelInputPort#>, output: <#T##ViewModelOutputPort#>)
        // usecase
        let usecase = CollectionModel(output: <#T##ModelOutputPort#>, input: <#T##APIRepositoryInput#>)
        
        return viewController
    }
    
    
}
