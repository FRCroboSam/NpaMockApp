import Foundation

struct Post: Codable, Identifiable, Hashable{
    
    enum CodingKeys: CodingKey {
        case image_or_video
        case like_count
        case comment_count
        case view_count
        case description
        case profile_img
        case profile_name
        case profile_id
        case post_id
    }
    
    var id = UUID() // Unique identifier for the post
    var image_or_video: String // Image name or URL
    var like_count: Int // Number of likes
    var comment_count: Int // Number of comments
    var view_count: Int // Number of views
    var description: String // Description of the post
    var profile_img: String // Profile image name or URL
    var profile_name: String // Profile name
    var profile_id: String // Profile ID
    var post_id: String
}
