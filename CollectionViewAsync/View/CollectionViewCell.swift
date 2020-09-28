//
//  CollectionViewCell.swift
//  CollectionViewAsync
//
//  Created by kohei yoshida on 2020/09/25.
//

import UIKit

protocol CollectionViewCellProtocol{
    func didUpdateCellStatus()
}

class CollectionViewCell: UICollectionViewCell,ViewModelOutputPort,ModelInputPort {

    private var collectionViewModel:CollectionViewModel?
    
    var delegate: CollectionViewCellProtocol?
    
    // ViewModelへ処理を渡す
    func startFetchData(url: URL) {
        self.collectionViewModel?.callUpdateFromView(url: <#T##URL#>)
    }
    
    
    // ViewModelからデータを受け取る
    func viewModelDidUpdate(image: UIImage) {
        // イメージデータをUIへセット
        // self.imageView.image = image みたいな
        // UI更新をコール
        delegate?.didUpdateCellStatus()
    }
    
}
