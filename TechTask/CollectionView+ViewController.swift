//
//  CollectionView+ViewController.swift
//  TechTask
//
//  Created by Артем Томило on 4.09.22.
//

import UIKit

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        songsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ViewController.cellIdentifier, for: indexPath) as? CustomCell else { return UICollectionViewCell() }
        
        cell.picture.image = songsList[indexPath.item].poster!
        
        DispatchQueue.main.async {
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
        }
        
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = scalingCarousel.currentCenterCellIndex?.item
        play(at: index ?? 0)
        scalingCarousel.scrollToItem(at: IndexPath(item: index ?? 0, section: 0), at: .top, animated: true)
        displaySongNameAndSingerName()
        playButton.pauseImage()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scalingCarousel.didScroll()
    }
}
