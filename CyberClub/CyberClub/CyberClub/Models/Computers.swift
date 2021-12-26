import Foundation
import UIKit
struct Computers: Codable{
    var id_pc: Int
    var type: String
    var status: String
    var ava: String
}

var logoImages: [UIImage] = [
    UIImage(named: "VIP.png")!,
    UIImage(named: "Pro.png")!,
    UIImage(named: "Standart.png")!
]


//MARK: - https://www.youtube.com/watch?v=ZHK5TwKwcE4&ab_channel=KarinPrater
//struct Computers: Codable, CustomStringConvertible{
//    var id: Int
//    var type: String
//    var status: String
//    var ava: String
//
//    var description: String {
//        return ("Object: \(id):\(type):\(status):\(ava)")
//    }
//
//    enum CodingKeys: String, CodingKeys {
//        case id: "id_pc"
//        case type
//        case status
//        case ava
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = try values.decode(String.self, forKey: .id)
//        type = try values.decode(String.self, forKey: .type)
//        status = try values.decode(String.self, forKey: .status)
//        ava = try values.decode(String.self, forKey: .ava)
//    }
//}

//extension Computers: CustomStringConvertible{
//    var description: String {
//        return ("Object: \(id   ):\(type):\(status):\(ava)")
//    }
//}

//struct Root: Decodable{
//    let computers: [Computers]?
//}


//struct Section
//{
//    let title : String
//    let computersData : [Computers]
//}
