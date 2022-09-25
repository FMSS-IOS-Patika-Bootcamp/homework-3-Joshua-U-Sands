//
//  PostsVC.swift
//  Odev 3
//
//  Created by Joshua Sands on 25.09.2022.
//

import UIKit
import Kingfisher

class PicturesVC: UIViewController {
    
    @IBOutlet weak var pictureCollection: UICollectionView!
    
    var urls:[URL] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pictureCollection.delegate = self
        pictureCollection.dataSource = self
        
        urlUtil().downloadURL()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            self.urls = urlUtil.myResponse.map({$0.url})
            self.pictureCollection.reloadData()
        }
    }
}

extension PicturesVC: UICollectionViewDelegate{
    
}

extension PicturesVC: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return urls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = pictureCollection.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! PictureCell
        cell.imageView.kf.setImage(with: urls[indexPath.row])
        return cell
    }
    
    
}
