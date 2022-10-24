import SwiftUI

//A note that is drawn and positioned based on its pitch
struct NoteView: View {
    var note: Note
    //The spacing between the staff line
    var spacing: CGFloat
    
    //The height of the note's stem line
    var stemHeight: CGFloat{
        spacing * 2.5
    }
    //The width of the note's head
    var headWidth: CGFloat{
        spacing * 1.2
    }
    
    //If the tail should be shown (in the future will depend on duration)
    var showTail = true
    
    var body: some View {
        ZStack(alignment: note.position < 0 ? .trailing : .leading) {
            
            HStack(alignment: note.position < 0 ? .top : .bottom, spacing: 0) {
                //Stem
                RoundedRectangle(cornerRadius: 40)
                    .innerShadow(width: 2, blur: 2)
                    .frame(width: 9, height: stemHeight)
                //Tail
                if showTail{
                    NoteTail()
                        .innerShadow(width: 1.5, blur: 2)
                        .frame(width: headWidth * 0.5, height: stemHeight - 25)
                        .rotation3DEffect(Angle(degrees: 180), axis: (x: note.position < 0 ? 1 : 0, y: 0, z: 0))
                }
            }
            .offset(x: (showTail && note.position < 0) ? headWidth*0.5 : 0)
            .offset(x: 0.7,y: stemHeight/2 * (note.position < 0 ? -1 : 1))
            
                
            //Head
            Ellipse()
                .innerShadow()
                .frame(width: headWidth, height: headWidth - 10)
                .rotationEffect(.degrees(-25))
                .background{
                    //Ledger line (When going out of the staff)
                    if abs(note.position) > 5 {
                        Capsule()
                            .innerShadow(width: 1.3, blur: 1.3)
                            .frame(width: headWidth * 1.5, height: 5)
                    }
                }
                   
        }
        .foregroundColor(note.color)
        .shadow(radius: 3, x: -5)
        .offset(y: CGFloat(-note.position) * (spacing / 2))
    }
    
}

extension Shape {
    //Provides an inner shadow to any type of shape
    func innerShadow(angle: Angle = .degrees(0), width: CGFloat = 5, blur: CGFloat = 6) -> some View {
        let finalX = CGFloat(cos(angle.radians - .pi / 2))
        let finalY = CGFloat(sin(angle.radians - .pi / 2))
        
        return self
            .overlay(
                    self
                        .stroke(.black, lineWidth: width)
                        .offset(x: finalX * width * 0.6, y: finalY * width * 0.6)
                        .blur(radius: blur)
                        .mask(self)
                )
    }
}


