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
        case title
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
    var title: String
    
    static func blankPost() -> Post{
        return Post(id: UUID(), image_or_video: "sdfsdf", like_count: 0, comment_count: 0, view_count: 0, description: "123", profile_img: "123", profile_name: "123", profile_id: "123", post_id: "23", title: "")
    }
    static func postFromVideo(url: String, profile_name: String, title: String) -> Post{
        return Post(id: UUID(), image_or_video: url, like_count: 0, comment_count: 0, view_count: 0, description: "", profile_img: "male_athlete1", profile_name: profile_name, profile_id: "123", post_id: UUID().uuidString, title: title)
    }
    static func postFromAthlete(athlete: Athlete) -> Post{
        let name = athlete.first_name + " " + athlete.last_name
        return Post(id: UUID(), image_or_video: athlete.profile_img, like_count: 0, comment_count: 0, view_count: 0, description: "", profile_img: athlete.profile_img, profile_name: name, profile_id: "123", post_id: UUID().uuidString, title: "SDF")

    }
}
