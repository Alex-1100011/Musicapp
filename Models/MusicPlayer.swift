import AVFoundation
import SwiftUI

//This structure can play notes from different pitches and instruments
struct MusicPlayer{
    let audioEngine = AVAudioEngine()
    let player = AVAudioPlayerNode()
    let pitchEffect = AVAudioUnitTimePitch()
    var audioFile: AVAudioFile?
    
    init(){
        setInstrument(to: .piano)
    }
    
    //Changes the instrument used for playing
    mutating func setInstrument(to instrument: Instruments){
        var url: URL
        if instrument == .violin {
            url = Bundle.main.url(forResource: "Violin-C3", withExtension: "m4a")!
        } else {
            url = Bundle.main.url(forResource: "Piano-C3", withExtension: "m4a")!
        }
        audioFile = try? AVAudioFile(forReading: url)
    }
    
    //Plays a note from the given pitch
    func play(pitch: Float = 0){
        player.volume = 1
        pitchEffect.pitch = pitch
        
        audioEngine.attach(player)
        audioEngine.attach(pitchEffect)
        audioEngine.connect(player, to: pitchEffect, format: nil)
        audioEngine.connect(pitchEffect, to: audioEngine.mainMixerNode, format: nil)
    
        if let audioFile = audioFile {
            player.scheduleFile(audioFile, at: nil)
        }
        
        audioEngine.prepare()
        do {
            try audioEngine.start()
        } catch {}

        player.play()

    }
    
    //Stops the player fading the sound
    func stop(){
        //Fading out
        var volume = 1.0
        for _ in 0...10000{
            player.volume = Float(volume)
            volume -= 0.001
            
        }
        player.stop()
        audioEngine.stop()
    }
    
    //Plays a note from the given pitch and given instrument
    mutating func play(pitch: Float, with instrument: Instruments){
        setInstrument(to: instrument)
        play(pitch: pitch)
    }
    
}

//The Instruments that can be used to play a note
enum Instruments {
    case violin, piano

    mutating func toggle() {
        switch self {
            case .violin:
                self = .piano
            case .piano:
                self = .violin
        }
    }
}
