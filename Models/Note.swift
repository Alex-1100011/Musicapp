import SwiftUI

//All the necessary information to display and play a note
struct Note: Identifiable{
    //The name value is used with the octave to get the note's position and pitch
    var name: names
    //Because a note (name) repeats every 7 the octave is like an index of repetition
    //e.g. the treble clef (the current one) can display notes from the 3rd and 4th octaves
    var octave: Int
    
    //Considering as position 0 the note in the middle of the staff, considering C3 in the middle (so using the Alto clef)
    var position: Int {
        //Because a note (name) repeats every 7 and we consider C of the 3rd octave as the one in the center (position 0). -6 is needed to pass from the Alto to the treble clef.
        name.rawValue + (octave - 3)*7 - 6
    }
    var pitch: Float {
        //200 is 1 tone (the distance between each note)
        var pitch = name.rawValue * 200
        //Between E and F there's a semi-tone (100 instead of 200)
        if name.rawValue >= 3 {
            pitch -= 100
        }
        //Adding 6 tones for each octave (considering the 3rd as reference, so +0)
        pitch += (octave - 3) * 1200
        return Float(pitch)
    }
    //A color associated to a specific note, based on the position
    var color: Color{
        //Repeating the colors based on the note, starting from the bottom of the staff (-4)
        colours[abs(-(position - 4)%colours.count)]
    }
    let id = UUID()
    
    
    let colours:[Color] = [ 
        .red, .orange, .yellow, .green, .mint, .purple, .indigo, .blue
    ]
    //The `Int` assigned in the `enum` represents the position of the notes on the staff
    //(Considering Alto clef and 3rd Octave as a reference, so that C is on the middle line, position 0)
    enum names: Int{
        //AKA Do,Re,Mi,Fa,Sol,La,Si
        case C,D,E,F,G,A,B
    }
    
    //A note is usually referred as "C3" (name + octave)
    init(_ name: names, _ octave: Int = 3){
        self.name = name
        self.octave = octave
    }
}
