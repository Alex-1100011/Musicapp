import SwiftUI

//A rounded button with the style of the WWDC22 poster.
struct CustomButton: View {
    @State private var isTapped = false
    //The symbol to be displayed
    var symbol: ()->Image
    //The action to be performed when the button is pressed
    var action: ()->Void
    
    var body: some View {
        ZStack{
            //Glow
            Circle()
                .padding(15)
                .foregroundColor(.blue)
                .blur(radius: 8)
                .mask {
                    AngularGradient(colors: [.clear, .white, .clear, .clear, .clear],
                                    center: .center, angle: .degrees(135))
                }
            Group {
                //Inner Circle
                Circle()
                    .foregroundColor(
                        isTapped ?
                            Color(hue: 0.606, saturation: 0.941, brightness: 0.185)
                        :
                            Color(hue: 0.634, saturation: 0.796, brightness: 0.084)
                )
                //Rainbow Stroke
                Circle()
                    .stroke(rainbowGradient, style: StrokeStyle(lineWidth: 1))
            }
            .padding(15)
            //Symbol
            symbol()
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
                .frame(width: 30, height: 30)
                
        }
        .onPressGesture(isTapped: $isTapped, onRelese: action)
    }
    //The gradient of the button's stroke
    let rainbowGradient = AngularGradient(
        colors: [.orange, .yellow, .green, .teal, .blue, .blue, .indigo, .indigo, .clear, .clear, .clear, .purple, .purple, .purple, .clear, .clear, .clear, .clear, .clear, .orange].reversed(),
        center: .center, startAngle: .degrees(-90), endAngle: .degrees(270))
}
