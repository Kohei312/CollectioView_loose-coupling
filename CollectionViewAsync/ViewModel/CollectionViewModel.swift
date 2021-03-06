//
//  CollectionViewModel.swift
//  CollectionViewAsync
//
//  Created by kohei yoshida on 2020/09/25.
//

import Foundation
import UIKit

// MARK:- ModelからViewControllerへ伝達する
protocol ViewModelOutputPort:AnyObject{
    func viewModelDidUpdate(collectionData:CollectionModelData)
}

// MARK:- ViewControllerからModelへ伝達する
protocol ViewModelInputPort:AnyObject{
    func callUpdateFromView(url:URL)
}

// MARK:- ModelとViewControllerの橋渡し
class CollectionViewModel:ModelOutputPort,ViewModelInputPort{

    // 初期化するときは、レイヤーの外側から
    private let modelInputPort: ModelInputPort
    
    // DIは、プロトコルに準拠する
    private weak var viewModelOutputPort: ViewModelOutputPort?
    
    init(input:ModelInputPort){
        self.modelInputPort = input
    }
    
    func inject(output:ViewModelOutputPort){
        self.viewModelOutputPort = output
    }

    // ViewModel → Modelへ伝達
    func callUpdateFromView(url: URL) {
        modelInputPort.startFetchData(url:url)
    }
    
    // Model → Viewへ、表示用データを返却
    func modelDidUpdate(value: CollectionModelData) {
        // modelの変化を、View側へ伝達する
        viewModelOutputPort?.viewModelDidUpdate(collectionData:value)
    }
    
    

}
