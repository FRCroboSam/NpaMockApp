import SwiftUI

struct CardBack : View {
    @State var athlete2: Athlete?
    let width : CGFloat
    let height : CGFloat
    @Binding var degree : Double

    var body: some View {
        let athlete = athlete2 ?? Athlete.defaultAthlete()
        ZStack {
            Image(athlete.profile_img)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: width ?? 170, height: height ??  220)
                .roundedCorner(15, corners: .allCorners)
                .overlay(alignment: .bottom){
                    VStack{
                        HStack{
                            VStack(alignment: .leading){
                                Text(athlete.first_name.uppercased())
                                    .font(.system(size: 20))
                                    .bold()
                                    .foregroundStyle(.white)
                                    .shadow(radius: 5)
                                Text(athlete.last_name.uppercased())
                                    .font(.system(size: 20))
                                    .bold()
                                    .foregroundStyle(.white)
                                    .shadow(radius: 5)
                                
                                Text(athlete.city + ", " + athlete.state)
                                    .font(.caption)
                                    .bold()
                                    .foregroundStyle(.white)
                                    .shadow(radius: 5)
                                    .lineLimit(1)
                            }
                            Spacer()
                        }
                        .frame(width: 7/8 * width)

                        .background{
                            Color(hex: "0A66C2")
                                .opacity(0.4)
                                .blur(radius: 10)
                                .frame(height: 75)
                                //.mask(Rectangle().padding(.top, 20)) /// here!
                        }
                        Spacer()
                            .frame(height: 15)
                        
                    }
                    
//                    .frame(width: 120)

                }

        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}


struct CardFront : View {
    @State var athlete2: Athlete?
    let width : CGFloat
    @State var text: String =
        "Bobby has been running track since the age of 15, with PRs of 11.34 in the 100m and 24.23 in the 200m. Bobby would love to run for a D3 school and is also a strong student, with a 3.7 GPA. "
    let height : CGFloat
    @Binding var degree : Double

    var body: some View {
        let athlete = Athlete.defaultAthlete()
        ZStack {
            Text(text)
                .foregroundStyle(.black.opacity(0.6))
                .lineLimit(8)
                .frame(width: 150, height: 180)

                .background{
                    
                        Image(athlete.profile_img)
                            .resizable()
                            .frame(width: width ?? 170, height: height ??  220)
                            .blur(radius: 20)
                            .opacity(0.2)
                            .roundedCorner(15, corners: .allCorners)

                    
                }
        }
        .padding(10)
        .frame(width: width, height: height)
        .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))

    }
}

struct BioCard: View {
    //MARK: Variables
    @State var backDegree = 0.0
    @State var frontDegree = -90.0
    @State var isFlipped = false

    let width : CGFloat = 180
    let height : CGFloat = 240
    let durationAndDelay : CGFloat = 0.3
    @State var athlete: Athlete?

    //MARK: Flip Card Function
    func flipCard () {
        isFlipped = !isFlipped
        if isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                frontDegree = 0
            }
        } else {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = -90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                backDegree = 0
            }
        }
    }
    //MARK: View Body
    var body: some View {
        ZStack {
            CardBack(athlete2: athlete ?? Athlete.defaultAthlete(), width: width, height: height, degree: $backDegree)
            CardFront(athlete2: athlete ?? Athlete.defaultAthlete(), width: width, height: height, degree: $frontDegree)

        }
        .zIndex(5000)
        .padding(.vertical, 10)
        .onTapGesture {
            flipCard ()
        }
    }
}


