//
//  CollectionViewModel.swift
//  CollectionViewAsync
//
//  Created by kohei yoshida on 2020/09/25.
//

import Foundation
import UIKit

protocol ViewModelOutputPort:AnyObject{
    func viewModelDidUpdate(image:UIImage)
}

protocol ViewModelInputPort:AnyObject{
    func callUpdateFromView(url:URL)
}

class CollectionViewModel:ModelOutputPort,ViewModelInputPort{

    private var modelInputPort: ModelInputPort?
    private var viewModelOutputPort: ViewModelOutputPort?
    
    init(input:ModelInputPort, output:ViewModelOutputPort){
        self.modelInputPort = input
        self.viewModelOutputPort = output
    }
    
    // ViewModel → Modelへ伝達
    func callUpdateFromView(url: URL) {
        modelInputPort?.startFetchData(url:url)
    }
    
    // Model → Viewへ、表示用データを返却
    func modelDidUpdate(value: CollectionData) {
        // modelの変化を、View側へ伝達する
        viewModelOutputPort?.viewModelDidUpdate(image:value.image)
    }
    
    

}
