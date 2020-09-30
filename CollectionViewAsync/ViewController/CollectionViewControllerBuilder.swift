//
//  CollectionViewControllerBuilder.swift
//  CollectionViewAsync
//
//  Created by kohei yoshida on 2020/09/28.
//

import Foundation
import UIKit

protocol CollectionViewControllerBuilderProtocol{
    
    func build()
}

extension CollectionViewController:CollectionViewControllerBuilderProtocol{

    
    func build(){
        // VC
        let viewController = self
            viewController.collectionView.register(CollectionViewCell.self)

        // View
        let dataSource = CollectionViewDataSource()
        // repository
        let repository = APIRepository()
        // presenter
        let presenter = CollectionViewModel(input: viewController as! ModelInputPort)
        // usecase
        let usecase = CollectionModel(input: repository)
        
        repository.inject(output: usecase)
        presenter.inject(output: viewController )
        usecase.inject(output: presenter)
        
    }
}
