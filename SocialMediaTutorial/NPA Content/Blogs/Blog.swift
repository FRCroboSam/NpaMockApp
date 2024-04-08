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
    
    static func defaultBlog() -> Blog{
        return Blog(image: "https://image.maxpreps.io/Gallery/84d0leQ3E0yH4uH4-SHKHg/QncpUFyYAEeUSSJxgxJbXg/1,768,567/south_lafourche_40_thibodaux_football_kenneth_p_steib.jpg?hidewatermark=V3VubnNkYXN3RGVWZ2lCMWdUYW10c2xYOVoyQ2pudk1oLzJxQUhNSnFhek5BOGV4T2NOTHNmbVc2ZEVScTFwUg&auto=webp&format=pjpg&quality=65&width=768", title: "Welcome to NPA", month: 12, day: 25, likes: 12, blog_id: "7A312412F97-2B14-4C80-BE91-EFA1B9C4D2E1")
    }
}


