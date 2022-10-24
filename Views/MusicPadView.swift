import SwiftUI

//A Group of music butons
struct MusicPadView:View {
    //Screen dimensions
    @Environment(\.geometry) var screenSize
    //Adaptive number of grid's columns
    var columns:[GridItem]{
        let nOfCol = screenSize.width <= 600 ? 2 : 4
        return Array(repeating: GridItem(.flexible()), count: nOfCol)
    }
    //Adaptive size of buttons
    var buttonSize:CGFloat{
        let scalingFactor:CGFloat = screenSize.width <= 600 ? 8 : 7
        return screenSize.width / scalingFactor
    }
    //The note and color associated to the button
    let notes = [Note(.E, 3),
                 Note(.F, 3),
                 Note(.G, 3),
                 Note(.A, 3),
                 Note(.B, 3),
                 Note(.C, 4),
                 Note(.D, 4),
                 Note(.E, 4)]
    
    var body: some View{
        LazyVGrid(columns: columns){
            ForEach(notes){ note in
                MusicButton(pitch: note.pitch)
                    .foregroundColor(note.color)
                    .frame(width: buttonSize, height: buttonSize)
                    .padding()
            }
        }
    }
    
}
