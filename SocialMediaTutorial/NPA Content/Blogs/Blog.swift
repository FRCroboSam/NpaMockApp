import Foundation

struct Blog: Codable, Identifiable, Hashable{
    
    enum CodingKeys: CodingKey {
        case image
        case title
        case month
        case day
        case likes
        case blog_id
    }
    
    var id = UUID() // Unique identifier for the post
    var image: String // Number of likes

    var title: String // Image name or URL
    var month: Int // Number of likes
    var day: Int // Number of comments
    var likes: Int // Description of the post
    var blog_id: String
    
//    static func defaultPodcast() -> Podcast{
//        return Podcast(image_or_video: "https://www.youtube.com/watch?v=luf5NOYaLcw", title: "Ep. 1 - Welcome to Sportslandia!", month: 12, day: 25, views: 2000, likes: 12, podcast_id: "7A3E6F97-2B14-4C80-BE91-EFA1B9C4D2E1")
//    }
}


