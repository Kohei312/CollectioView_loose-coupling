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

    }
    
        

    func viewModelDidUpdate(collectionData: CollectionModelData) {
        // UI描画に必要な情報をセット
        self.dataCollections = collectionData.data
//        self.dataCollections.append(collectionData)
        // イメージをセット
        DispatchQueue.main.async{
            self.collectionView.reloadData()
        }
    }
 
    
    
}

extension CollectionViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    // 2
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        var count = 0
        
        if self.dataCollections.count == 0{
            count = 1
        } else  {
            count = self.dataCollections.count
        }
        
        return count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // cellは、Modelと結びつく形で管理
        let cell  = collectionView.dequeueReusableCell(CollectionViewCell.self,indexPath: indexPath)
        
        if self.dataCollections.count > 0{
            cell.configure(self.dataCollections[indexPath.row])
        } else {
            
            // テスト用URLを入力
            let url = ImageURL.url
            self.viewModelIputPort?.callUpdateFromView(url:url)
        }
        // 返却されたデータをCellプロパティに格納する
        return cell
    }

    
}




