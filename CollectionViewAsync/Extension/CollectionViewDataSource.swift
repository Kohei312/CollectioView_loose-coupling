//
//  CollectionView.swift
//  CollectionViewAsync
//
//  Created by kohei yoshida on 2020/09/25.
//

import Foundation
import UIKit




class CollectionViewDataSource:NSObject,UICollectionViewDelegate,UICollectionViewDataSource,ViewModelInputPort{

    
    private var collectionViewModel:ViewModelInputPort?
    
    // ViewModelへ処理を渡す
    func callUpdateFromView(url: URL) {
        self.collectionViewModel?.callUpdateFromView(url: url)
    }

    
    
    // 2
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        

        
        // cellは、Modelと結びつく形で管理
        let cell  = collectionView.dequeueReusableCell(CollectionViewCell.self,indexPath: indexPath)

        // データ取得処理を呼び出す
        self.callUpdateFromView(url: <#T##URL#>)
        
        // 返却されたデータをCellプロパティに格納する
        
        return cell
    }
    
}

