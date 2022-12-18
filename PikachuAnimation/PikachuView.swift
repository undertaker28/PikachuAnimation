//
//  PikachuView.swift
//  PikachuAnimation
//
//  Created by Pavel on 9.10.22.
//

import SwiftUI

struct PikachuView: View {
    
    @State var tail = false
    @State var shockLeft = false
    @State var shockRight = false
    @State var visibilityOpacity = false
    
    var body: some View {
        ZStack{
            Color("Background").edgesIgnoringSafeArea(.all)
            VStack{
                Text("PIKACHU")
                    .font(Font.custom("MarkPro-Bold", size: 50))
                    .foregroundColor(Color("FontColor"))
                
                ZStack{
                    // MARK: - Tail
                    Image("Tail")
                        .resizable()
                        .frame(width: 300, height: 300, alignment: .center)
                        .shadow(color: .yellow, radius: 0.5, x: 0.0, y: 0.0)
                        .rotationEffect(.degrees(9))
                        .offset(x: 80, y: 0)
                        .rotationEffect(.degrees(tail ? 0 : 35))
                        .animation(Animation.easeInOut(duration: 1).delay(5).repeatForever(autoreverses: true))
                        .onAppear(){
                            self.tail.toggle()
                        }
                    
                    //MARK: - Body: close eyes
                    Image("Position1")
                        .resizable()
                        .frame(width: 350, height: 350, alignment: .center)
                        .shadow(color: .yellow, radius: 0.5, x: 0.0, y: 0.0)
                    
                    //MARK: - Body: open eyes
                    Image("Position2")
                        .resizable()
                        .frame(width: 350, height: 350, alignment: .center)
                        .shadow(color: .yellow, radius: 0.5, x: 0.0, y: 0.0)
                        .opacity(visibilityOpacity ? 1 : 0)
                        .animation(Animation.easeInOut(duration: 0.2).delay(2).repeatForever(autoreverses: true))
                        .onAppear(){
                            self.visibilityOpacity.toggle()
                        }
                    
                    //MARK: - Shock
                    Image("ShockLeft")
                        .resizable()
                        .frame(width: 350, height: 350)
                        .shadow(color: .yellow, radius: 2, x: 0.0, y: 0.0)
                        .opacity(shockLeft ? 1 : 0)
                        .clipShape(Circle().offset(x: shockLeft ? 0 : 125))
                        .animation(Animation.interpolatingSpring(
                            stiffness: 30, damping: 10).speed(5).repeatForever(autoreverses: true).delay(1))
                        .onAppear() {
                            self.shockLeft.toggle()
                        }
                    
                    Image("ShockRight")
                        .resizable()
                        .frame(width: 350, height: 350)
                        .shadow(color: .yellow, radius: 2, x: 0.0, y: 0.0)
                        .opacity(shockRight ? 1 : 0)
                        .clipShape(Circle().offset(x: shockRight ? 0 : -125))
                        .animation(Animation.interpolatingSpring(
                            stiffness: 30, damping: 10).speed(5).repeatForever(autoreverses: true).delay(1))
                        .onAppear() {
                            self.shockRight.toggle()
                        }
                }
                
            }
        }
    }
}

struct PikachuView_Previews: PreviewProvider {
    static var previews: some View {
        PikachuView()
    }
}
