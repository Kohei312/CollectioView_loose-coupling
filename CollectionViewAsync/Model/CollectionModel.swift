//
//  CollectionDataModel.swift
//  CollectionViewAsync
//
//  Created by kohei yoshida on 2020/09/25.
//

import Foundation


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

    private let input:APIRepositoryInput?
    private weak var output:ModelOutputPort?
    
    init(input:APIRepositoryInput){
        self.input = input
    }
    
    func inject(output:ModelOutputPort){
        self.output = output
    }
     
    var storedCollectionData:[CollectionData] = []
    
    // repositoryからデータ返却
    func didFetchData(_ data: Data) {
        // データをCollectionData型に成形・格納
        let collectionData = CollectionData(imageData: data)
        
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
