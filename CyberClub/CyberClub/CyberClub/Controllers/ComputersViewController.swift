//class ComputersViewController: UICollectionViewController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.navigationItem.setHidesBackButton(true, animated: true)
//    }
//}


import UIKit
import Alamofire

class ComputersViewController: UIViewController, UICollectionViewDataSource{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var computers = [Computers]()
    let URL_COMPUTERS = URL(string: "http://localhost:8080/CyberClub/v1/computers.php")!
    
    override func viewDidLoad() {
//        getPC { _computers in
//            self.computers = _computers
//            print(self.computers.count)
//        }
//        getPC(){ _computers in
//            self.computers = _computers
//            print(self.computers.count)
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
//            print(self.computers.count)
//            self.collectionView.reloadData()
//        }
        
        
        
        super.viewDidLoad()
        tabBarController?.navigationItem.hidesBackButton = true
        collectionView.dataSource = self
        
        //Sending request
        
        printPC()
        //self.collectionView.reloadData()
        print(computers)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CustomCollectionViewCell
//        let item = computers[indexPath.row].id_pc
//        cell.nameLabel.text = String(item).capitalized
        cell.nameLabel.text = "123"
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.computers.count
    }
    
    
    
    // Количество элементов в одной секции
    //    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    //        return computers.count
    //    }
    //    // Создаем ячейку и возвращаем - значение ячейки береться именно отсюда
    //    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    //        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
    //        let item = computers[indexPath.row]
    //        cell.cellLabel?.text = String(indexPath.row)
    //        cell.cellLabel?.text = "\(item.status)"
    //        //cell.backgroundColor = UIColor.green
    //
    //        return cell
    //    }
    
    
    // Изменение размера ячеек относительно экрана
    //    func collctionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeforItemAtIndexPath: NSIndexPath) -> CGSize {
    //        //let size = CGSize()
    //    }
    
    
    
    
    func  getPC (onComplete: @escaping ([Computers] ) -> Void){
        var computerArray =  [Computers]() // The array with values
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
                    computerArray.append(item)
                }
                
                onComplete(computerArray)
            }
            self.collectionView.reloadData()
        }
        //print(self.computers)}
    }
    
    
    func printPC(){
        DispatchQueue.main.async {
            print(self.computers)
        }
    }
    
}


//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        guard let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
//            return print("failed segue")
//        }
//        vc.name = computers[indexPath.row].status
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
//
//
//
//
//
//
//
//
//
//
//
//
////    func getComputers(){
////        URLSession.shared.dataTask(with: url!, completionHandler: { data, response, error in
////            if error == nil {
////                do {
////                    self.computers = try JSONDecoder().decode([Computers].self, from: data!)
////                }catch{
////                    print("Parse Error")
////                }
////            }
////            DispatchQueue.main.sync {
////                print(self.computers.count)
////            }
////        })
////    }
//
////
////    func parseComputers(){
////        Alamofire.request(url!).responseJSON { response in
////            let result = response.data
////            do{
////                self.computers = try JSONDecoder().decode([Computers].self, from: result! )
////                for computer in self.computers {
////                    print(computer.id_pc,":",computer.status)
////                }
////
////            }catch{
////                print("error")
////            }
////        }
////    }

























////
////  ComputersViewController.swift
////  CyberClub
////
////  Created by Iliya Rahozin on 13.12.2021.
////
//
//import UIKit
//import Alamofire
//
//class ComputersViewController: UICollectionViewController {
//    var computers = [Computers]()
//    let URL_COMPUTERS = URL(string: "http://localhost:8080/CyberClub/v1/computers.php")
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        //Sending request
//
//        //print(computers.description)
//        //print("testing")
//        // Do any additional setup after loading the view.
//
//        //parseComputers()
//    }
//
//    // Количество элементов в одной секции
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return computers.count
//    }
//    // Создаем ячейку и возвращаем - значение ячейки береться именно отсюда
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
//        let item = computers[indexPath.row]
//        cell.cellLabel?.text = String(indexPath.row)
//        cell.cellLabel?.text = "\(item.status)"
//        //cell.backgroundColor = UIColor.green
//
//        return cell
//    }
//    // Изменение размера ячеек относительно экрана
//    //    func collctionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeforItemAtIndexPath: NSIndexPath) -> CGSize {
//    //        //let size = CGSize()
//    //    }
//
//
//
//
////    func getPC(completion: @escaping([Computers]?) -> Void){
////        Alamofire.request(URL_COMPUTERS!, method: .get).validate().responseJSON{ response in
////            //printing response
////            print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
////            print(response)
////            guard response.result.isSuccess else {
////                print("Ошибка при запросе данных\(String(describing: response.result.error))")
////                return
////            }
////
////            guard let arrayOfItems = response.result.value as? [[String:String]]
////            else {
////                print("Не могу перевести в массив")
////                return
////            }
////
////            for itm in arrayOfItems {
////                //                //let item = Computers(id_pc: itm["id_pc"] as! Int, type: itm["type"] as! String, status: itm["status"] as! String, ava: itm["ava"] as! String )
////                let item = (
////                    Computers(id_pc: Int(itm["id_pc"]!),
////                              type: itm["type"],
////                              status: itm["status"],
////                              ava: itm["ava"]
////                             )
////                )
////                print(item)
////                //self.computers.append(item)
////                //print(itm["id_pc"])
////            }
////            //completion(item)
////        }
////
////    }
//
//
//    //    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//    //        guard let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
//    //            return print("failed segue")
//    //        }
//    //        vc.name = computers[indexPath.row].status
//    //        self.navigationController?.pushViewController(vc, animated: true)
//    //    }
//
//
//
//
//
//
//
//
//
//
//
//
////    func getComputers(){
////        URLSession.shared.dataTask(with: url!, completionHandler: { data, response, error in
////            if error == nil {
////                do {
////                    self.computers = try JSONDecoder().decode([Computers].self, from: data!)
////                }catch{
////                    print("Parse Error")
////                }
////            }
////            DispatchQueue.main.sync {
////                print(self.computers.count)
////            }
////        })
////    }
//
////
////    func parseComputers(){
////        Alamofire.request(url!).responseJSON { response in
////            let result = response.data
////            do{
////                self.computers = try JSONDecoder().decode([Computers].self, from: result! )
////                for computer in self.computers {
////                    print(computer.id_pc,":",computer.status)
////                }
////
////            }catch{
////                print("error")
////            }
////        }
////    }
//
//
//
//
//}
//
//
//
////MARK: - Нормальный парсер
////func getPC() -> [Computers] {
////    var temp = [Computers]()
////    Alamofire.request(url!, method: .get).validate().responseJSON{ response in
////        //printing response
////        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
////        //print(response)
////        guard response.result.isSuccess else {
////            print("Ошибка при запросе данных\(String(describing: response.result.error))")
////            return
////        }
////
////        guard let arrayOfItems = response.result.value as? [[String:String]]
////        else {
////            print("Не могу перевести в массив")
////            return
////        }
////        //print(arrayOfItems)
////
////        for itm in arrayOfItems {
////            //var id: Int? = Int(itm["id_pc"]!)
////            let item = Computers(id_pc: Int(itm["id_pc"]!)!,
////                                 type: itm["type"]!,
////                                 status: itm["status"]!,
////                                 ava: itm["ava"]!)
////            //print(item)
////            temp.append(item)
////            DispatchQueue.main.async {
////                self.collectionView.reloadData()
////            }
////        }
////        //print(self.compArr)
//////            print(temp)
//////            for i in temp{
//////                self.compArr.append(i)
//////            }
//////            DispatchQueue.main.async {
//////                self.collectionView.reloadData()
//////            }
////
////    }
////    return temp
////}
////
//////
//////    func jsonPC(completion: @escaping (Root) -> Void){
//////        Alamofire.request(url!).response { response in
//////            guard let data = response.data else {return}
//////            do {
//////                let decoder = JSONDecoder()
//////                let json = try decoder.decode(Root.self, from: data)
//////                DispatchQueue.main.async {
//////                    completion(json)
//////                }
//////            }
//////            catch {
//////                print("\(error)")
//////            }
//////        }
//////    }
//
//
//
////func jsonPC(completion: @escaping ([Computers]) -> Void){
////        Alamofire.request(URL_COMPUTERS!).response { response in
////            guard let data = response.data else {return}
////            do {
////                let decoder = JSONDecoder()
////                let json = try decoder.decode([Computers].self, from: data)
////                DispatchQueue.main.async {
////                    completion(json)
////                }
////            }
////            catch {
////                print("\(error)")
////            }
////        }
////}
