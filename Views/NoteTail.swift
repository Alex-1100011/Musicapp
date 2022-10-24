
import SwiftUI

//The tail of the note
struct NoteTail: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        var tailPath = Path()
        
        tailPath.move(to: CGPoint(x: rect.minX + 0.00370 * rect.width, y: rect.minY + 0.99857 * rect.height))
        tailPath.addLine(to: CGPoint(x: rect.minX + 0.00370 * rect.width, y: rect.minY + 0.64143 * rect.height))
        tailPath.addCurve(to: CGPoint(x: rect.minX + 0.84444 * rect.width, y: rect.minY + 0.27143 * rect.height), control1: CGPoint(x: rect.minX + 0.36667 * rect.width, y: rect.minY + 0.55857 * rect.height), control2: CGPoint(x: rect.minX + 0.84444 * rect.width, y: rect.minY + 0.43000 * rect.height))
        tailPath.addCurve(to: CGPoint(x: rect.minX + 0.69259 * rect.width, y: rect.minY + 0.03857 * rect.height), control1: CGPoint(x: rect.minX + 0.84444 * rect.width, y: rect.minY + 0.19000 * rect.height), control2: CGPoint(x: rect.minX + 0.78519 * rect.width, y: rect.minY + 0.11143 * rect.height))
        tailPath.addCurve(to: CGPoint(x: rect.minX + 0.77778 * rect.width, y: rect.minY + 0.00000 * rect.height), control1: CGPoint(x: rect.minX + 0.68148 * rect.width, y: rect.minY + 0.01571 * rect.height), control2: CGPoint(x: rect.minX + 0.72963 * rect.width, y: rect.minY + 0.00000 * rect.height))
        tailPath.addCurve(to: CGPoint(x: rect.minX + 0.85185 * rect.width, y: rect.minY + 0.01571 * rect.height), control1: CGPoint(x: rect.minX + 0.80370 * rect.width, y: rect.minY + 0.00000 * rect.height), control2: CGPoint(x: rect.minX + 0.83333 * rect.width, y: rect.minY + 0.00429 * rect.height))
        tailPath.addCurve(to: CGPoint(x: rect.minX + 1.00000 * rect.width, y: rect.minY + 0.27143 * rect.height), control1: CGPoint(x: rect.minX + 0.94444 * rect.width, y: rect.minY + 0.09571 * rect.height), control2: CGPoint(x: rect.minX + 1.00000 * rect.width, y: rect.minY + 0.18286 * rect.height))
        tailPath.addCurve(to: CGPoint(x: rect.minX + 0.00370 * rect.width, y: rect.minY + 0.99857 * rect.height), control1: CGPoint(x: rect.minX + 1.00000 * rect.width, y: rect.minY + 0.56286 * rect.height), control2: CGPoint(x: rect.minX + 0.00370 * rect.width, y: rect.minY + 0.70714 * rect.height))
        tailPath.closeSubpath()
        
        return tailPath
        
    }
    
}
