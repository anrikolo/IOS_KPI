//
//  ComputersCollectionViewController.swift
//  CyberClub
//
//  Created by Iliya Rahozin on 23.12.2021.
//

import UIKit
import Alamofire

private let reuseIdentifier = "Cell"

class ComputersCollectionViewController: UICollectionViewController {
    
    var computers = [Computers]()
    let URL_COMPUTERS = URL(string: "http://localhost:8080/CyberClub/v1/computers.php")!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
//        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
//        view.addGestureRecognizer(tap)
        self.hideKeyboardWhenTappedAround()



        // self.clearsSelectionOnViewWillAppear = false
        tabBarController?.navigationItem.hidesBackButton = true
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            
            Alamofire.request(self.URL_COMPUTERS, method: .get).validate().responseJSON{ response in
                //printing response
                print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                print(response)
                guard response.result.isSuccess else {
                    print("Ошибка при запросе данных\(String(describing: response.result.error))")
                    return
                }
                
                guard let arrayOfItems = response.result.value as? [[String:String]]
                else {
                    print("Не могу перевести в массив")
                    return
                }
                
                for itm in arrayOfItems {
                    let item = (
                        Computers(id_pc: Int(itm["id_pc"]!)!,
                                  type: itm["type"]!,
                                  status: itm["status"]!,
                                  ava: itm["ava"]!
                                 )
                    )
                    self.computers.append(item)
                    self.collectionView.reloadData()
                }
            }.resume()
            
        }
        // Register cell classes
        self.navigationItem.hidesBackButton = true
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
    }
    
   
    // MARK: CreatingCollectionCells
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // return the number of items
        return computers.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "compCell", for: indexPath) as! CollectionViewCell
        
        // Configure the cell
        let item = computers[indexPath.row]
        cell.textLabel.text = String(item.id_pc)
        cell.contentView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        cell.contentView.layer.borderWidth = 1.0
        
        switch item.status {
        case "Free":
            //cell.backgroundColor = .green
            cell.statusImg.tintColor = .green
        case "Busy":
            //cell.backgroundColor = .red
            cell.statusImg.tintColor = .red
        case "Available in 15 min":
            //cell.backgroundColor = .yellow
            cell.statusImg.tintColor = .yellow
        case "Not available":
            //cell.backgroundColor = .gray
            cell.statusImg.tintColor = .gray
        default:
            //cell.backgroundColor = .gray
            cell.statusImg.tintColor = .gray
        }
        return cell
    }
    
    
    // Auto changing size of cells
    func collectionView(CollectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath ) -> CGSize {
        let size  =  CGSize(width: 100, height: 100)
        return size
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        let item = computers[indexPath.row]
        vc?.name = String(item.id_pc)
        vc?.pcType = String(item.type)
        self.navigationController?.pushViewController(vc!, animated: true)
    }

    
}

