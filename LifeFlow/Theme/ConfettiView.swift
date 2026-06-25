import SwiftUI

public struct ConfettiView: View {
    @Binding var isPresented: Bool
    
    struct ConfettiPiece: Identifiable {
        let id = UUID()
        let color: Color
        let shape: AnyView
        let xSpeed: Double
        let ySpeed: Double
        let size: CGFloat
        var x: CGFloat
        var y: CGFloat
        var rotation: Double
    }
    
    @State private var pieces: [ConfettiPiece] = []
    @State private var timer: Timer? = nil
    
    public var body: some View {
        GeometryReader { geo in
            ZStack {
                ForEach(pieces) { piece in
                    piece.shape
                        .foregroundColor(piece.color)
                        .frame(width: piece.size, height: piece.size)
                        .position(x: piece.x, y: piece.y)
                        .rotationEffect(.degrees(piece.rotation))
                }
            }
            .onAppear {
                if isPresented {
                    spawnConfetti(in: geo.size)
                }
            }
            .onChange(of: isPresented) { newValue in
                if newValue {
                    spawnConfetti(in: geo.size)
                } else {
                    pieces.removeAll()
                }
            }
        }
        .ignoresSafeArea()
        .allowsHitTesting(false)
    }
    
    private func spawnConfetti(in size: CGSize) {
        let colors: [Color] = [.red, .blue, .green, .yellow, .pink, .purple, .orange, Color(hex: "#FF006E"), Color(hex: "#7209B7")]
        var newPieces: [ConfettiPiece] = []
        
        for _ in 0..<75 {
            let color = colors.randomElement()!
            let shapeType = Int.random(in: 0...2)
            let shape: AnyView
            if shapeType == 0 {
                shape = AnyView(Circle())
            } else if shapeType == 1 {
                shape = AnyView(Rectangle())
            } else {
                shape = AnyView(
                    Path { path in
                        path.move(to: CGPoint(x: 5, y: 0))
                        path.addLine(to: CGPoint(x: 10, y: 10))
                        path.addLine(to: CGPoint(x: 0, y: 10))
                        path.closeSubpath()
                    }
                )
            }
            
            let piece = ConfettiPiece(
                color: color,
                shape: shape,
                xSpeed: Double.random(in: -4...4),
                ySpeed: Double.random(in: 11...21),
                size: CGFloat.random(in: 6...14),
                x: size.width / 2 + CGFloat.random(in: -30...30),
                y: size.height + 20,
                rotation: Double.random(in: 0...360)
            )
            newPieces.append(piece)
        }
        
        self.pieces = newPieces
        
        timer?.invalidate()
        var ticks = 0
        timer = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { _ in
            ticks += 1
            if ticks > 110 {
                self.timer?.invalidate()
                self.isPresented = false
                self.pieces.removeAll()
                return
            }
            
            for i in 0..<pieces.count {
                pieces[i].y -= CGFloat(pieces[i].ySpeed - Double(ticks) * 0.38)
                pieces[i].x += CGFloat(pieces[i].xSpeed)
                pieces[i].rotation += 8
            }
        }
    }
}
