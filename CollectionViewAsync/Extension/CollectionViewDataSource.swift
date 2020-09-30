////
////  CollectionView.swift
////  CollectionViewAsync
////
////  Created by kohei yoshida on 2020/09/25.
////
//
//import Foundation
//import UIKit
//
//
//extension CollectionViewController:UICollectionViewDelegate,UICollectionViewDataSource{
//
//
//    // 2
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//        return 1
//    }
//    
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        
//
//        
//        // cellは、Modelと結びつく形で管理
//        let cell  = collectionView.dequeueReusableCell(CollectionViewCell.self,indexPath: indexPath)
//        
//        // 返却されたデータをCellプロパティに格納する
//        return self.configure(cell, data:dataCollections[indexPath.row])
//    }
//    
//    func configure(_ cell:CollectionViewCell, data:CollectionData)->CollectionViewCell{
//        
//    }
//    
//}
//
