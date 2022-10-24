import SwiftUI

//Lets select between different songs
struct ScoreSelectorView: View {
    @EnvironmentObject var musicScore: MusicScore
    var scores = [odeToJoy, TwinkleTwinkle]
    @State var selectedIndex = 0
    
    var isBackDisabled: Bool{
        selectedIndex == 0
    }
    var isNextDisabled: Bool{
        selectedIndex == scores.count - 1
    }
    
    var body: some View {
        HStack {
            Text("\(musicScore.score.title) - \(musicScore.score.author)")
            
            //Selects the previous score from the list
            Button(action: {
                withAnimation{
                    musicScore.score = scores[selectedIndex - 1]
                }
                selectedIndex -= 1
            }){
                Image(systemName: "arrow.left.square.fill")
            }
            .disabled(isBackDisabled)
            .opacity(isBackDisabled ? 0.5 : 1)
            
            //Selects the next score from the list
            Button(action: {
                withAnimation{
                    musicScore.score = scores[selectedIndex + 1]
                }
                selectedIndex += 1
            }){
                Image(systemName: "arrow.right.square.fill")
            }
            .disabled(isNextDisabled)
            .opacity(isNextDisabled ? 0.5 : 1)
        
            Spacer()
        }
        .font(.title2)
        .foregroundColor(.white)
    }
}

