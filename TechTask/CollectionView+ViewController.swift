//
//  CollectionView+ViewController.swift
//  TechTask
//
//  Created by Артем Томило on 4.09.22.
//

import UIKit

extension ViewController: UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        songsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ViewController.cellIdentifier, for: indexPath) as? CustomCell else { return UICollectionViewCell() }
        
        cell.picture.image = songsList[indexPath.item].poster!
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        play(at: indexPath.item)
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .left)
        playButton.pauseImage()
        displaySongNameAndSingerName()
    }
}
