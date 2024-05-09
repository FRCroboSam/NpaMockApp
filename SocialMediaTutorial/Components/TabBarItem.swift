
import Foundation
import SwiftUI

//struct TabBarItem: Hashable {
//    let iconName: String
//    let title: String
//    let color: Color
//}

enum TabBarItem: Hashable {
    case athletes, shop, events, train, tickets, athlete2s, shop2, event2s, train2, ticket2s
    var iconName: String {
        switch self {
        case .athletes: return "figure.run"
        case .shop: return "cart"
        case .events: return "calendar"
        case .train: return "dumbbell.fill"
        case .tickets: return "ticket.fill"
        case .athlete2s: return "figure.run"
        case .shop2: return "cart"
        case .event2s: return "calendar"
        case .train2: return "dumbbell.fill"
        case .ticket2s: return "ticket.fill"

        }
    }
    
    var title: String {
        switch self {
        case .athletes: return "Athletes"
        case .shop: return "Shop"
        case .events: return "Events"
        case .train: return "Train"
        case .tickets: return "Tickets"
        case .athlete2s: return "figure.run"
        case .shop2: return "cart"
        case .event2s: return "calendar"
        case .train2: return "dumbbell.fill"
        case .ticket2s: return "ticket.fill"
        }
    }
    
    var color: Color {
        return Color.blue//Color.teal
    }
}
