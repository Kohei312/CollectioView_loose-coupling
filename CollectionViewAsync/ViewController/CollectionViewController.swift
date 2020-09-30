//
//  ViewController.swift
//  CollectionViewAsync
//
//  Created by kohei yoshida on 2020/09/25.
//

import UIKit


class CollectionViewController: UIViewController,ViewModelInputPort{
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
//    let builder = CollectionViewControllerBuilder()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ViewModelへVCで初期化したものを注入
        CollectionViewControllerBuilder.build()
        // CollectionViewCellを登録
        collectionView.cell.delegate = self
    }
    
    func callUpdateFromView(url:URL){
        
    }
    
    // UI更新をコール
    func didUpdateCellStatus(){
        self.collectionView.reloadData()
    }

}



