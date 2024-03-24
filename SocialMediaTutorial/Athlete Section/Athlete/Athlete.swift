import Foundation

struct Athlete: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case first_name
        case last_name
        case gender
        case sport
        case height
        case year
        case city
        case state
        case age
        case weight
        case GPA
        case ACT_OR_SAT
        case about
        case profile_img
    }
    
    var id = UUID() // Unique identifier for the post
    var first_name: String // Image name or URL
    var last_name: String // Number of likes
    var gender: String // Number of comments
    var sport: String // Number of views
    var height: String // Description of the post
    var year: String // Profile image name or URL
    var city: String // Profile name
    var state: String // Profile ID
    var age: Int
    var weight: Int
    var GPA: Double
    var ACT_OR_SAT: Int
    var about: String
    var profile_img: String
    
    
}
