//
//  CollectionDataModel.swift
//  CollectionViewAsync
//
//  Created by kohei yoshida on 2020/09/25.
//

import Foundation
import UIKit

// CollectionViewModelから、データを出力するprotocol
// このプロトコルは、どのクラスにも対応できることを証明 → AnyObject
protocol ModelOutputPort:AnyObject{
    func modelDidUpdate(value:CollectionData)
}

// CollectionViewModelへ、データを入力するprotocol
// 今回はRepository層でのデータ取得に連絡する
protocol ModelInputPort{
    func startFetchData(url:URL)
}

class CollectionModel:ModelInputPort,APIRepositoryOutput{

    private weak var output:ModelOutputPort?
    private weak var input:APIRepositoryInput?
    
    init(output:ModelOutputPort,input:APIRepositoryInput){
        self.output = output
        self.input = input
    }
     
    var storedCollectionData:[CollectionData] = []
    
    // repositoryからデータ返却
    func didFetchData(_ data: Data) {
        // データをCollectionData型に成形・格納
        guard let image = UIImage(data:data) else {return}
        let collectionData = CollectionData(image: image)
        
        // 取得したデータを取得する
        self.storedCollectionData.append(collectionData)
        
        // -> 非同期でデータ受信後に、outputメソッドをコール
        output?.modelDidUpdate(value: collectionData)
    }
    
    func startFetchData(url: URL) {
        // Repository層へ連絡
        // APIをコール
        input?.callAPI(from: url)
        
    }
    
}
