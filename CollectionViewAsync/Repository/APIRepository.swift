//
//  APIRepository.swift
//  CollectionViewAsync
//
//  Created by kohei yoshida on 2020/09/25.
//

import Foundation


// ModelからAPIへ伝達する
protocol APIRepositoryInput:AnyObject{
    func callAPI(from url:URL)
}

protocol APIRepositoryOutput:AnyObject{
    func didFetchData(_ data:Data)
}

class APIRepository:APIRepositoryInput{

    private weak var apiRepository:APIRepositoryOutput?
    
//    init(output:APIRepositoryOutput){
//        self.apiRepository = output
//    }
    
    func inject(output:APIRepositoryOutput){
        self.apiRepository = output
    }
    
    func callAPI(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let err = error{
                print("通信エラー :",err)
            }
            
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data
                else { return }
            
            self.apiRepository?.didFetchData(data)
            
        }.resume()
    }
}
