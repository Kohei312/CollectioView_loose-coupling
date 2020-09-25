//
//  CollectionViewModel.swift
//  CollectionViewAsync
//
//  Created by kohei yoshida on 2020/09/25.
//

import Foundation


class CollectionViewModel:ModelOutputPort{
    
    // CollectionDataModelで呼ばれた処理を、ここで引き継ぐ
    func modelDidUpdate(value: CollectionData, conmpletion: @escaping (CollectionData) -> Void) {
        <#code#>
        
        // View描画用にデータを整形して返却
    }
    
}
