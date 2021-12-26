
//
//import UIKit
//import Alamofire
//
//class TestViewController: UIViewController, UICollectionViewDataSource{
//
//
//    var compArr = [Computers]()
//    let url = URL(string: "http://localhost:8080/CyberClub/v1/computers.php")
//
//    @IBOutlet weak var textLabel: UILabel!
//    
//    @IBOutlet weak var collectionView: UICollectionView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        collectionView.dataSource = self
//
//        //compArr = getPC()
////        jsonPC() { data in
////            print(data)
////        }
//        textLabel?.text = String(compArr.count)
//
//        URLSession.shared.dataTask(with: url!) { (data, response, error) in
//            guard let data = data else {return}
//            guard error == nil else {return}
//            print(data)
//            do {
//                let pc = try JSONDecoder().decode(Computers.self, from: data)
//                print(pc.id_pc)
//            } catch let error {
//                print(error)
//            }
//
//        }.resume()
//    }
//
//
//
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
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
//
//
//    func getPC() -> [Computers] {
//        var temp = [Computers]()
//        Alamofire.request(url!, method: .get).validate().responseJSON{ response in
//            //printing response
//            print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
//            //print(response)
//            guard response.result.isSuccess else {
//                print("Ошибка при запросе данных\(String(describing: response.result.error))")
//                return
//            }
//
//            guard let arrayOfItems = response.result.value as? [[String:String]]
//            else {
//                print("Не могу перевести в массив")
//                return
//            }
//            //print(arrayOfItems)
//
//            for itm in arrayOfItems {
//                //var id: Int? = Int(itm["id_pc"]!)
//                let item = Computers(id_pc: Int(itm["id_pc"]!)!,
//                                     type: itm["type"]!,
//                                     status: itm["status"]!,
//                                     ava: itm["ava"]!)
//                //print(item)
//                temp.append(item)
//                DispatchQueue.main.async {
//                    self.collectionView.reloadData()
//                }
//            }
//            //print(self.compArr)
////            print(temp)
////            for i in temp{
////                self.compArr.append(i)
////            }
////            DispatchQueue.main.async {
////                self.collectionView.reloadData()
////            }
//
//        }
//        return temp
//    }
//
////
////    func jsonPC(completion: @escaping (Root) -> Void){
////        Alamofire.request(url!).response { response in
////            guard let data = response.data else {return}
////            do {
////                let decoder = JSONDecoder()
////                let json = try decoder.decode(Root.self, from: data)
////                DispatchQueue.main.async {
////                    completion(json)
////                }
////            }
////            catch {
////                print("\(error)")
////            }
////        }
////    }
//
//
//
//
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CustomCollectionViewCell
//        let item = compArr[indexPath.row]
//        //cell.nameLabel.text = String(item.id_pc)
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return compArr.count
//        //return 10
//    }
//
//
//    // Изменение размера ячеек относительно экрана
//    //    func collctionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeforItemAtIndexPath: NSIndexPath) -> CGSize {
//    //        //let size = CGSize()
//    //    }
//
//
//
//}
//
//
//
///**
// for itm in arrayOfItems {
// //print(itm["id_pc"]!,":",itm["status"]!)
//
// //                    let item = Computers(id_pc: itm["id_pc"] as! Int, type: itm["type"] as! String, status: itm["status"] as! String, ava: itm["ava"] as! String )
// var item = Computers(id_pc: itm["id_pc"]!.intValue, type: itm["type"]!.stringValue, status: itm["status"]!.stringValue, ava: itm["ava"]!.stringValue)
// //                    self.computers.append(Computers(id_pc: itm["id_pc"]!.intValue ,
// //                                                    type: itm["type"]!.stringValue, status: itm["status"]!.stringValue,
// //ava: itm["ava"]!.stringValue ))
// self.computers.append(item)
// //self.computers.append(item)
// //print(itm["id_pc"],":",itm["status"])
// }
//
// */
//
////    func getComputers(){
////        Alamofire.request(url!).responseJSON { response in
////            let result = response.data
////            print(result)
////            do{
////                self.computers = try JSONDecoder().decode([Computers].self, from: result!)
////                for pc in self.computers{
////                    print( pc.id_pc, ":", pc.ava)
////                }
////            }catch{
////              print("error", error)
////            }
////        }
////    }
//
//
////
////func fetchPC(){
////    let request = Alamofire.request(url!)
////    request.responseJSON { data in
////        print(data)
////    }
////}
////
////func updateInterface() {
////    // update the UI here using the `userUIDArray` variable
////    //CollectionViewCell.reloadData()
//
