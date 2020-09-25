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
    func modelDidUpdate(value:CollectionData,conmpletion:@escaping (_ value: CollectionData)-> Void)
}

// CollectionViewModelへ、データを入力するprotocol
// 今回はRepository層でのデータ取得に連絡する
protocol ModelInputPort{
    func updateState(url:URL)
}

class CollectionModel:ModelInputPort,APIRepositoryOutput{

    private weak var output:ModelOutputPort?
    private weak var input:APIRepositoryInput?
    
    init(output:ModelOutputPort,input:APIRepositoryInput){
        self.output = output
        self.input = input
    }
     
    // repositoryからデータ返却
    func didFetchData(_ data: Data) {
        // データをCollectionData型に成形・格納
        
        // -> 非同期でデータ受信後に、outputメソッドをコール
        output?.modelDidUpdate(value: <#T##CollectionData#>, conmpletion: <#T##(CollectionData) -> Void#>)
    }
    
    func updateState(url: URL) {
        // Repository層へ連絡
        input?.callAPI(from: url)

    }
    
}
