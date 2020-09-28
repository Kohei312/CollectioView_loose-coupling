//
//  ViewController.swift
//  CollectionViewAsync
//
//  Created by kohei yoshida on 2020/09/25.
//

import UIKit


class CollectionViewController: UIViewController,CollectionViewControllerProtocol{
    
    // UI更新をコール
    func didUpdateCellStatus(){
        self.collectionView.reloadData()
    }
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ViewModelへVCで初期化したものを注入
        
        // CollectionViewCellを登録
        collectionView.register(CollectionViewCell.self)
        collectionView.cell.delegate = self
    }

}



