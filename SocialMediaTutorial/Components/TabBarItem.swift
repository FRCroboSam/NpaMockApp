
import Foundation
import SwiftUI

//struct TabBarItem: Hashable {
//    let iconName: String
//    let title: String
//    let color: Color
//}

enum TabBarItem: Hashable {
    case athletes, shop, events, train, tickets
    var iconName: String {
        switch self {
        case .athletes: return "figure.run"
        case .shop: return "cart"
        case .events: return "calendar"
        case .train: return "dumbbell.fill"
        case .tickets: return "ticket.fill"

        }
    }
    
    var title: String {
        switch self {
        case .athletes: return "Athletes"
        case .shop: return "Shop"
        case .events: return "Events"
        case .train: return "Train"
        case .tickets: return "Tickets"
        }
    }
    
    var color: Color {
        return Color.blue//Color.teal
    }
}
