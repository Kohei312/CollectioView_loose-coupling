//
//  Nib.swift
//  CollectionViewAsync
//
//  Created by kohei yoshida on 2020/09/25.
//

import Foundation
import UIKit

// UINibの基底クラスを抽象化
protocol CellProtocol:class {}

// extensionで変数を定義
extension CellProtocol{
    static var nibName:String{return String(describing: self)}
    static var identifier:String {return nibName}
}

// UICollectionViewCellを、UINibのプロトコルに準拠
extension UICollectionViewCell:CellProtocol{}

// UICollectionViewCellを汎用化し、引数にUICollectionViewCellが入ることを暗黙的に規定。

extension UICollectionView{
    // UICollectionViewCellインスタンスに依存せず、Cellを登録できる
    func register<T:UICollectionViewCell>(_ cell:T.Type){
        let nib = UINib(nibName: T.nibName, bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: T.identifier)
    }
    
    // UICollectionViewCellインスタンスに依存せず、Cellを再利用できる
    func dequeueReusableCell<T:UICollectionViewCell>(_ cell:T.Type,indexPath:IndexPath)-> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T else { fatalError("\(T.identifier)のCell名が見つかりません")
        }
        return cell
    }
    
}
