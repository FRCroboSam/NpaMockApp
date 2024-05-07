
import SwiftUI
import SnapToScroll

struct SampleSnappingListView: View {
enum ScrollDirection {
    case up
    case down
    case left
    case right
    case none
}
    let colors: [Color] = [.red, .green, .blue]

@State var scrollDirection: ScrollDirection = .none

    var body: some View {
        ScrollViewReader { value in
                    ScrollView {
                        Button("Jump to #8") {
                            withAnimation{
                                value.scrollTo(8)
                            }
                        }
                        .padding()

                        ForEach(0..<100) { i in
                            Text("Example \(i)")
                                .font(.title)
                                .frame(width: 200, height: 200)
                                .background(colors[i % colors.count])
                                .id(i)
                        }
                    }
                }
                .frame(height: 350)
    }
}

struct SampleSnappingListView_Previews: PreviewProvider {
   static var previews: some View {
      NavigationView {
        SampleSnappingListView()
            .navigationTitle("Snapping list")
            .navigationBarTitleDisplayMode(.inline)
    }
  }
}
