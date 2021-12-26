struct PC: Decodable {
    var id_pc: Int
    var type: String
    var status: String
    var urlPhoto: String
    
    enum CodingKeys: String, CodingKey{
        case id = "id_pc"
        case type
        case status
        case urlPhoto = "ava"
    }
    
    init(id_pc: Int, type: String,  status: String , urlPhoto: String) {
            self.id_pc = id_pc
            self.type = type
            self.status = status
            self.urlPhoto =  urlPhoto
    }
   init(from decoder:Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id_pc = try values.decode(Int.self, forKey: .id)
            type = try values.decode(String.self, forKey: .type)
            status = try values.decode(String.self, forKey: .status)
            urlPhoto = try values.decode(String.self, forKey: .urlPhoto)
        }

}

//extension PC: Displayable {
//  var idLabelText: String {
//    id
//  }
//
//  var subtitleLabelText: String {
//    "Episode \(String(id))"
//  }
//
//  var item1: (label: String, value: String) {
//    ("DIRECTOR", director)
//  }
//
//  var item2: (label: String, value: String) {
//    ("PRODUCER", producer)
//  }
//
//  var item3: (label: String, value: String) {
//    ("RELEASE DATE", releaseDate)
//  }
//
//  var listTitle: String {
//    "STARSHIPS"
//  }
//
//  var listItems: [String] {
//    starships
//  }
//}
