//
//  ViewController.swift
//  ImagePaginationAndList
//
//  Created by Apple on 03/08/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var sliderCollectionView : UICollectionView!
    @IBOutlet weak var pageView : UIPageControl!

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var imageArr = [UIImage(named: "image1"),
                    UIImage(named: "image2"),
                    UIImage(named: "image3"),
                    UIImage(named: "image4")]
    
    var tableArr = ["RedColor","GreenColor","YellowColor","BlueColor","BlackColor","BrownColor","YellowColor","PinkColor"]
    var tableImgArr = ["tag","calling","insta","location","tick","money","fb","hill"]

    var searchData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageView.numberOfPages = imageArr.count
        pageView.currentPage = 0
        searchData = tableArr
    }

}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return imageArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        if let vc = cell.viewWithTag(111) as? UIImageView{
            vc.image = imageArr[indexPath.row]
        } else  if let ab = cell.viewWithTag(222) as? UIPageControl{
            ab.currentPage = indexPath.row
        }
        return cell
    }

}

extension ViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let size = sliderCollectionView.frame.size
        return CGSize(width: size.width, height: size.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        return 0.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        return 0.0
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = self.tableView.dequeueReusableCell(withIdentifier: "tableCell", for:indexPath)
        tableCell.textLabel?.text = searchData[indexPath.row]
        tableCell.textLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        tableCell.detailTextLabel?.isHidden = true
        tableCell.imageView?.image = UIImage(named: tableImgArr[indexPath.row])
        return tableCell
    }
    
    
}

extension ViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchData = []
        for searchTxt in tableArr{
            if(searchBar.text == ""){
                searchData = tableArr
            }else{
                if(searchTxt.lowercased().contains(searchBar.text!.lowercased())){
                    searchData.append(searchTxt)
                }
            }
            
            tableView.reloadData()
        }
    }
}
