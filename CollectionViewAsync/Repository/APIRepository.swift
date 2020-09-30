//
//  APIRepository.swift
//  CollectionViewAsync
//
//  Created by kohei yoshida on 2020/09/25.
//

import Foundation


// MARK:- ModelからAPIRepositoryへ伝達する
protocol APIRepositoryInput:AnyObject{
    func callAPI(from url:URL)
}

// MARK:- APIRepositoryからModelへ伝達する
protocol APIRepositoryOutput:AnyObject{
    func didFetchData(_ data:Data)
}

class APIRepository:APIRepositoryInput{

    // クラス初期化時はnil
    private weak var apiRepository:APIRepositoryOutput?
    
    // クラス初期化後に、protocolを注入
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
