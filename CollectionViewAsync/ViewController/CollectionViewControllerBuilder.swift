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
        self.collectionView.register(CollectionViewCell.self)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        

        // repository
        let repository = APIRepository()
        // usecase
        let usecase = CollectionModel(input: repository)
        // presenter
        let presenter = CollectionViewModel(input: usecase)

        
        /* 各クラスに、protocolを注入。
        クラス内に定義した変数を初期化する */
        
        repository.inject(output: usecase)
        presenter.inject(output: self)
        usecase.inject(output: presenter)
        self.inject(input: presenter)
        
    }
}
