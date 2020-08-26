
import Foundation

struct FactList: Decodable {
    var _id : String?
    var text : String?
    var type : String?
    var user : User?
    var upvotes : Int?
    var userUpvoted : String?
}

struct User: Decodable {
    var _id : String?
    var name : Name?
}
    
struct Name: Decodable {
    var first : String?
    var last : String?
}
    
