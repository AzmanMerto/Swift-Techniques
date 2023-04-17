//
//  CustomShapeCamp.swift
//  ? - (TR) - Profesyonel Yazılım
//
//  Created by NomoteteS on 17.04.2023.
//

import SwiftUI

struct CustomShapeCamp: View {
    var body: some View {
        List {
            NavigationLink {
                Default()
            } label: {
                Text("Default")
            }
            
            NavigationLink {
                Arc()
            } label: {
                Text("Arc")
            }
            
            NavigationLink {
                Animate()
            } label: {
                Text("Animate")
            }
        }
    }
}

//MARK: Default -

private struct Default: View {
    var body: some View {
        VStack {
            HStack {
                Rectangle()
                    .trim(from: 0, to: 0.5)
                    .scaledToFit()
                    .frame(height: 50)
                
                Spacer()
                
                Text("Yarım")
            }.padding(.horizontal, UIScreen.main.bounds.width * 0.2)
            
            triangle()
                .frame(width: 100)
                .scaledToFit()
        }
    }
}

private struct triangle: Shape {
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
}

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let horizontal0ffset: CGFloat = rect.width * 0.2
            path.move(to: CGPoint (x: rect.midX, y: rect .minY))
            path.addLine (to: CGPoint (x: rect.maxX - horizontal0ffset, y: rect.midY))
            path.addLine (to: CGPoint (x: rect.midX, y: rect.maxY))
            path.addLine (to: CGPoint (x: rect.minX + horizontal0ffset, y: rect.midY))
            path.addLine (to: CGPoint (x: rect.midX, y: rect.minY))
        }
    }
}

//MARK: Arc -

private struct Arc: View {
    var body: some View {
        VStack {
            
        }
    }
}

private struct archSample: Shape {
    func path(in rect: CGRect) -> Path {
        Path{ path in
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                        radius: rect.height / 2,
                        startAngle: Angle(degrees: 0),
                        endAngle: Angle(degrees: 360),
                        clockwise: false)
        }
    }
}

private struct ShapeWithArc: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            // top left
            path.move (to: CGPoint (x: rect.minX, y: rect.minY))
            // top right
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            // I mid right
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            // bottom
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY - 65),
                        radius: rect.height / 2,
                        startAngle: Angle(degrees: 0),
                        endAngle: Angle(degrees: 180),
                        clockwise: false)
            //            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            // mid left
            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        }
    }
}

private struct WaterShape: Shape {
    func path (in rect: CGRect) -> Path {
        Path { path in
            path.move (to: CGPoint(x: rect.minX, y: rect.midY))
            path.addQuadCurve (
                to: CGPoint (x: rect.midX, y: rect.midY),
                control: CGPoint(x: rect.width * 0.25, y: rect.height * 0.25))
            path.addQuadCurve (
                to: CGPoint (x: rect.maxX, y: rect.midY),
                control: CGPoint(x: rect.width * 0.75, y: rect .height * 0.75))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
}

//MARK: Animate -

private struct Animate: View {
    var body: some View {
        VStack {
            
        }
    }
}

struct RectangleWithSingleCornerAnimation: Shape {
    var cornerRadius: CGFloat
    
    var animatableData: CGFloat {
        get { cornerRadius }
        set { cornerRadius = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .zero)
            path.addLine(to: CGPoint (x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - cornerRadius))
           
            path.addArc(center: CGPoint(x: rect.maxX, y: rect.minY),
                        radius: cornerRadius,
                        startAngle: Angle(degrees: 0),
                        endAngle: Angle(degrees: 360),
                        clockwise: false)
            
            path.addLine(to: CGPoint(x: rect.maxY - cornerRadius, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
}

struct Pacman: Shape {
    var offsetAmount: Double
    var animatableData: Double {
        get { offsetAmount }
        set { offsetAmount = newValue }
    }
    func path (in rect: CGRect) -> Path {
        Path { path in
            path.move (to: CGPoint (x: rect.midX, y: rect.minY))
            path.addArc (
                center: CGPoint (x: rect.midX, y: rect.minY),
                radius: rect.height / 2,
                startAngle: Angle (degrees: offsetAmount) ,
                endAngle: Angle (degrees: 360 - offsetAmount) ,
                clockwise: false)
        }
    }
}
