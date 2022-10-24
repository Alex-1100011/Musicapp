import SwiftUI

//A button that will play a specific note when tapped
struct MusicButton: View {
    @Environment(\.geometry) var screenSize
    //To get the instrument
    @EnvironmentObject var score: MusicScore
    
    @State var isTapped = false
    //To play the note (one for each button, so that more buttons can be played together)
    @State var player = MusicPlayer()
    //The note pitch
    var pitch: Float
    
    
    var body: some View {
        ZStack {
            let radius = screenSize.width/30
            //Inner rectangle
            RoundedRectangle(cornerRadius: radius)
                .opacity(isTapped ? 1 : 0.3)
            
            //Outer stroke
            RoundedRectangle(cornerRadius: radius)
                .stroke(lineWidth: 8)
        }
        //Press Gesture
        .onPressGesture(isTapped: $isTapped){
            player.play(pitch: pitch, with: score.selectedInstrument)
        } onRelese: {
            player.stop()
        }
        //Pulse Animation
        .pulseAnimation(isActive: $isTapped)
        
    }
}
