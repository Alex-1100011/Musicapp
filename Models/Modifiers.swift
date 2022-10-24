import SwiftUI

//Press Gesture
//This gesture creates a bouncy scaling effect when a view is tapped, functions can be executed when it is pressed or released
//It is used for the `Custom Button` and `Music Button`
struct PressGesture: ViewModifier {
    @Binding var isTapped: Bool
    var onPress: (()->Void)?
    var onRelese: ()->Void
    
    var pressGesture: some Gesture {
        DragGesture(minimumDistance: 0)
            .onChanged{ _ in
                if !isTapped{
                    //First time the .onChanged method gets called
                    onPress?()
                }
                isTapped = true
            }
            .onEnded{ _ in
                onRelese()
                isTapped = false
            }
    }
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(isTapped ? 0.6 : 1)
            .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 3), value: isTapped)
            .gesture(pressGesture)
    }
}

//This modifier overlay a pulse effect used when playing a `Music Button`
struct PulseAnimation: ViewModifier {
    @State var animationAmount = 0.6
    @Binding var isActive: Bool
    @Environment(\.geometry) var screenSize
    
    func body(content: Content) -> some View {
        content.overlay(
            RoundedRectangle(cornerRadius: screenSize.width/30)
                .stroke(lineWidth: 4)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .blur(radius: animationAmount - 0.5)
                .opacity(animationAmount == 0.6 ? 0 : 1)
                .animation(.easeOut(duration: 0.5).delay(0.3).repeat(while: isActive), value: animationAmount)
                .opacity(isActive ? 1 : 0)
                
        )
            .onChange(of: isActive){ newValue in
                if newValue {
                    animationAmount = 2
                } else {
                    animationAmount = 0.6
                }
            }
    }
}

extension Animation {
    func `repeat`(while condition: Bool) -> Animation {
        if condition {
            return self.repeatForever(autoreverses: false)
        } else {
            return self
        }
    }
}

extension View {
    
    func onPressGesture(isTapped: Binding<Bool>, onPress: (()->Void)? = nil, onRelese: @escaping ()->Void) -> some View {
        modifier(PressGesture(isTapped: isTapped, onPress: onPress, onRelese: onRelese))
    }
    
    func pulseAnimation(isActive: Binding<Bool>) -> some View{
        modifier(PulseAnimation(isActive: isActive))
    }
    
}

//Geometry reader in the environment
//It is used to get the size of the window and pass it down to components
private struct geometryKey: EnvironmentKey {
  static let defaultValue = CGSize()
}


extension EnvironmentValues {
  var geometry: CGSize {
    get { self[geometryKey.self] }
    set { self[geometryKey.self] = newValue }
  }
}
