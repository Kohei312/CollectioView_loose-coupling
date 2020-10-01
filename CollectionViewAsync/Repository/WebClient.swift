//
//  WebClient.swift
//  CollectionViewAsync
//
//  Created by kohei yoshida on 2020/10/01.
//

import Foundation

protocol WebClientProtocol{
    func callAPI(from url:URL,completion:@escaping(Data)->Void)
}

class WebClient:WebClientProtocol{

    func callAPI(from url: URL, completion: @escaping (Data) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let err = error{
                print("通信エラー :",err)
            }
            
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data
                else { return }
            
            completion(data)
            
            
        }.resume()
    }
}
