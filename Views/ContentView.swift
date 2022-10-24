import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            //Music Pad
            MusicPadView()
            Spacer()
            HStack {
                //Player buttons
                PlayerView()
                VStack(spacing: 0) {
                    //Staff
                    ScoreSelectorView()
                    ScrollView(.horizontal) {
                        StaffView()
                            .padding([.bottom, .trailing])
                    }
                }
            }
        }
        .environmentObject(MusicScore(score: odeToJoy))
        .padding()
        .background(backgroundGradient)
    }
    
    let backgroundGradient = LinearGradient(colors: [
        Color(red: 3/255, green: 14/255, blue: 33/255),
        Color(red: 5/255, green: 16/255, blue: 34/255),
        .black], startPoint: .topLeading, endPoint: .bottomTrailing
    )
}
