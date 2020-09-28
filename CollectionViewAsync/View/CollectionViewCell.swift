//
//  CollectionViewCell.swift
//  CollectionViewAsync
//
//  Created by kohei yoshida on 2020/09/25.
//

import UIKit

class CollectionViewCell: UICollectionViewCell,ViewModelOutputPort,ModelInputPort {

    private var collectionViewModel:CollectionViewModel?
    
    
    
    // ViewModelへ処理を渡す
    func startFetchData(url: URL) {
        self.collectionViewModel?.callUpdateFromView(url: <#T##URL#>)
    }
    
    
    // ViewModelからデータを受け取る
    func viewModelDidUpdate(image: UIImage) {
        <#code#>
    }
    
}
