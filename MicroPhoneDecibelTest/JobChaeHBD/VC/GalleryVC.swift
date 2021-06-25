//
//  GalleryVC.swift
//  JobChaeHBD
//
//  Created by 황지은 on 2021/06/22.
//

import UIKit

class GalleryVC: UIViewController {
    
    var galleryArray:[String] = []
    @IBOutlet var galleryCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGalleryArray()
        galleryCV.delegate = self
        galleryCV.dataSource = self
    }
    
    func setGalleryArray() {
        
        for i in 1...66 {
            galleryArray.append("\(i)")
        }
    }
    
    @IBAction func touchUpToBackBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension GalleryVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galleryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let galleryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCVCell", for: indexPath) as! GalleryCVCell
        
        galleryCell.galleryImageView.image = UIImage(named: galleryArray[indexPath.row])
        
        return galleryCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 343, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
                            UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
