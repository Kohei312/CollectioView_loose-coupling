//
//  ViewController.swift
//  CollectionViewAsync
//
//  Created by kohei yoshida on 2020/09/25.
//

import UIKit


class CollectionViewController: UIViewController,ViewModelOutputPort{

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var viewModelIputPort:ViewModelInputPort?
    private var dataCollections:[CollectionData] = []
    
    func inject(input:ViewModelInputPort){
        self.viewModelIputPort = input
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ViewModelへVCで初期化したものを注入
        self.build()
        // CollectionViewCellを登録
        collectionView.cell.delegate = self
    }
        
//    // UI更新をコール
//    func didUpdateCellStatus(){
//    }

    
    func viewModelDidUpdate(collectionData: CollectionData) {
        // UI描画に必要な情報をセット
        self.dataCollections.append(collectionData)
        // イメージをセット
        self.collectionView.cell.updateImage()
        self.collectionView.reloadData()
    }
    
}



