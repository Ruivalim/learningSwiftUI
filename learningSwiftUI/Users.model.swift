import Foundation

struct User: Hashable, Codable {
    let id: Int
    let name: String
    let avatar = "https://picsum.photos/200" // Using static photo since the free api doesnt have profile picture
    let username: String
    let phone: String
    let website: String
    
    let address: Address
    
    struct Address: Codable {
        var street: String
        var suite: String
        var city: String
        var zipcode: String
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
}
