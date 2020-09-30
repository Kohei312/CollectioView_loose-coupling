//
//  CollectionViewCell.swift
//  CollectionViewAsync
//
//  Created by kohei yoshida on 2020/09/25.
//

import UIKit


class CollectionViewCell: UICollectionViewCell{
    
    
    @IBOutlet weak var imageView: UIImageView!

    override func prepareForReuse() {
        super.prepareForReuse()

        self.imageView.image = nil
    }
    
    func configure(_ data:CollectionData){
        // ここにimageViewの描画処理を記述
        let image = UIImage(data: data.imageData)
        self.imageView.image = image?.resized(toWidth:100)

    }
    
}
