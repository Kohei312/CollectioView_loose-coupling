//
//  CollectionView.swift
//  CollectionViewAsync
//
//  Created by kohei yoshida on 2020/09/25.
//

import Foundation
import UIKit


class CollectionViewDataSource:NSObject,UICollectionViewDelegate,UICollectionViewDataSource{

    
    
    
    
    
    
    
    // 2
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        

        
        // cellは、Modelと結びつく形で管理
        let cell  = collectionView.dequeueReusableCell(CollectionViewCell.self,indexPath: indexPath)

        // データ取得処理を呼び出す
  
        
        // 返却されたデータをCellプロパティに格納する
        
        return cell
    }
    
}

