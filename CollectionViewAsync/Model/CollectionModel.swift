//
//  CollectionDataModel.swift
//  CollectionViewAsync
//
//  Created by kohei yoshida on 2020/09/25.
//

import Foundation


// MARK:- CollectionViewModelから、データを出力するprotocol
// このプロトコルは、どのクラスにも対応できることを証明 → AnyObject
protocol ModelOutputPort:AnyObject{
    func modelDidUpdate(value:CollectionData)
}

// MARK:- CollectionViewModelへ、データを入力するprotocol
// 今回はRepository層でのデータ取得に連絡する
protocol ModelInputPort{
    func startFetchData(url:URL)
}

// MARK:- ViewModelとRepositoryの橋渡し
class CollectionModel:ModelInputPort,APIRepositoryOutput{

    private let input:APIRepositoryInput?
    private weak var output:ModelOutputPort?
    
    // クラス初期化時に、APIRepositoryInputを初期化
    init(input:APIRepositoryInput){
        self.input = input
    }
    
    // クラス初期化後に、ModelOutputPortを注入
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
