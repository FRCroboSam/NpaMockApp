
import Foundation
import SwiftUI
struct Fancy3DotsIndexView: View {
  
  // MARK: - Public Properties
  
  let numberOfPages: Int
  let currentIndex: Int
  //TODO: implement this tmrw in place of the NPA Content View
  
  // MARK: - Drawing Constants
  
  private let circleSize: CGFloat = 8
  private let circleSpacing: CGFloat = 6
  
  private let primaryColor = Color.gray
  private let secondaryColor = Color.gray.opacity(0.6)
  
  private let smallScale: CGFloat = 0.6
  
  
  // MARK: - Body
  
  var body: some View {
    HStack(spacing: circleSpacing) {
      ForEach(0..<numberOfPages) { index in // 1
          if shouldShowIndex(index) {
          Circle()
            .fill(currentIndex == index ? primaryColor : secondaryColor) // 2
            .scaleEffect(currentIndex == index ? 1 : smallScale)
            
            .frame(width: circleSize, height: circleSize)
       
            .transition(AnyTransition.opacity.combined(with: .scale)) // 3
            
            .id(index) // 4
        }
      }
    }
  }
  
  
  // MARK: - Private Methods
  
    func shouldShowIndex(_ index: Int) -> Bool {
        if(numberOfPages >= 4 && currentIndex == 0 || numberOfPages >= 4 && currentIndex == numberOfPages - 1){
            if(numberOfPages >= 4 && currentIndex == 0 && index < 4 ||
               numberOfPages >= 4 && currentIndex == numberOfPages - 1 && index > numberOfPages - 5 ){
                return true
            }
        }
        return ((currentIndex - 2)...(currentIndex + 2)).contains(index)
  }
}
