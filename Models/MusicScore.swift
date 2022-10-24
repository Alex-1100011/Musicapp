import SwiftUI

//This class groups all the necessary to play a music score
class MusicScore: ObservableObject{
    //the notes and other informations about the score
    @Published var score: score
    
    //To show the marker on the staffView
    @Published var playingNoteIndex: Int?
    //The instrument to play with
    @Published var selectedInstrument: Instruments
    //Used for global state
    @Published var isPlaying = false
    //To play the score
    var player: MusicPlayer
    //All the timers that will play the score (one for each note)
    var timers: [Timer]
    
    //Plays the notes in the `notes` array
    func play(){
        isPlaying = true
        //This variable controls when timers will be fired, so it controls the playing duration
        //In the future this variable could be set based on the note's duration
        var iteration = 0.0
        //-1 so it can be incremented to the first position (0)
        self.playingNoteIndex = -1
    
        for note in score.notes {
            timers.append(
                Timer.scheduledTimer(withTimeInterval: iteration, repeats: false) { _ in
                    
                    self.player.stop()
                    self.player.play(pitch: note.pitch)
                    self.playingNoteIndex? += 1
                    
                }
            )
            iteration += 1
        }
        //The last timer stops the player (and resets the variables)
        timers.append(
            Timer.scheduledTimer(withTimeInterval: iteration, repeats: false) { _ in
                self.stopPlayer()
            })
    }
    //Stops the player
    func stopPlayer(){
        player.stop()
        for timer in timers {
            timer.invalidate()
        }
        self.playingNoteIndex = nil
        self.isPlaying = false
    
    }
    //Changes the instrument that will play the score
    func setInstrument(to instrument: Instruments){
        player.setInstrument(to: instrument)
    }
    
    
    init(score: score){
        self.score = score
        selectedInstrument = .piano
        playingNoteIndex = nil
        player = MusicPlayer()
        timers = []
    }
    
}
//Notes and other informations about the score
struct score: Equatable {
    var title: String
    var author: String
    var notes: [Note]
    
    static func == (lhs: score, rhs: score) -> Bool {
        lhs.title == rhs.title
    }
}

//Sample scores
let odeToJoy = score(
    title: "Ode To Joy",
    author: "Beethoven",
    notes: [
        Note(.B, 3),
        Note(.B, 3),
        Note(.C, 4),
        Note(.D, 4),
        Note(.D, 4),
        Note(.C, 4),
        Note(.B, 3),
        Note(.A, 3),
        Note(.G, 3),
        Note(.G, 3),
        Note(.A, 3),
        Note(.B, 3),
        Note(.B, 3),
        Note(.A, 3)
    ]
)

let TwinkleTwinkle = score(
    title: "Twinkle Twinkle Little Star",
    author: "Mozart",
    notes: [
        Note(.C, 3),
        Note(.C, 3),
        Note(.G, 3),
        Note(.G, 3),
        Note(.A, 3),
        Note(.A, 3),
        Note(.G, 3),
        Note(.F, 3),
        Note(.F, 3),
        Note(.E, 3),
        Note(.E, 3),
        Note(.D, 3),
        Note(.D, 3),
        Note(.C, 3)
    ]
)
