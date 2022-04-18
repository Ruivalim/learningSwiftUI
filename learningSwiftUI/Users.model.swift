import Foundation

struct User: Codable {
    let id: Int
    let name: String
    let avatar = "https://picsum.photos/200" // Using static photo since the free api doesnt have profile picture
}
