
import SwiftUI
import SnapToScroll
import Combine

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
    @State var detector: CurrentValueSubject<CGFloat, Never>
    @State var publisher: AnyPublisher<CGFloat, Never>

    init() {
        let detector = CurrentValueSubject<CGFloat, Never>(0)
        self.publisher = detector
            .debounce(for: .seconds(0.2), scheduler: DispatchQueue.main)
            .dropFirst()
            .eraseToAnyPublisher()
        self.detector = detector
    }
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
                    .background(GeometryReader {
                        Color.clear.preference(key: ViewOffsetKey.self,
                            value: -$0.frame(in: .named("scroll")).origin.y)
                    })
                    .onPreferenceChange(ViewOffsetKey.self) { detector.send($0) }

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

struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}
