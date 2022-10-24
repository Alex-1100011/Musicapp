import SwiftUI

//Displays the notes on a music Staff
struct StaffView: View {
    @Environment(\.geometry) var screenSize
    
    //The spacing between each line
    var spacing: CGFloat{
        screenSize.width <= 600 ? 30 : 40
    }
    //To place the notes on the staff
    @EnvironmentObject var musicScore: MusicScore
    
    var body: some View {
        ZStack(alignment: .leading) {
            //Playing Marker
                let noteWidth = spacing * 1.23
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color(hue: 0.606, saturation: 0.502, brightness: 0.348))
                    .frame(width: spacing + 30, height: spacing*5)
                    .offset(x: (spacing + noteWidth) * CGFloat(musicScore.playingNoteIndex ?? 0))
                    .animation(.spring(), value: musicScore.playingNoteIndex)
                    .opacity(musicScore.playingNoteIndex == nil ? 0 : 1)
            
            
            //Background Lines
            VStack(spacing: 0){
                ForEach(0 ..< 5) { index in
                    Capsule()
                        .frame(height: 5)
                        .frame(height: 0)
                        .padding(.bottom, index == 4 ? 1 : spacing)
                }
            }
            .foregroundColor(.white)
            .opacity(0.8)
            
            //Notes
            HStack(spacing: spacing) {
                
                ForEach(musicScore.score.notes) { note in
                    NoteView(note: note, spacing: spacing)
                }
                
            }
            .padding(.leading)
        }
        .padding(.bottom, spacing)
    }
}
