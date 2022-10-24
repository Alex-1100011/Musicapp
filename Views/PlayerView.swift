import SwiftUI

//The buttons that controls the score player
struct PlayerView:View{
    @EnvironmentObject var score: MusicScore
    
    var body: some View{
        VStack{
            //Instrument Button
            CustomButton(){
                if score.selectedInstrument == .violin{
                    return Image(systemName: "pianokeys.inverse")
                }
                return Image("violin")
            } action: {
                score.selectedInstrument.toggle()
                score.setInstrument(to: score.selectedInstrument) 
            }
            .frame(width: 90, height: 90)
            
            Spacer()
            
            //Player Button
            CustomButton(){
                Image(systemName: score.isPlaying ?
                      "pause.fill" :
                      "play.fill")
            } action: {
                if score.isPlaying {
                    score.stopPlayer()
                } else {
                    score.play()
                }
            }
            .frame(width: 90, height: 90)
        }
        .frame(minHeight: 100, maxHeight: 200)
        
    }
}

