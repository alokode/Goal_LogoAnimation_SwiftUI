//
//  ContentView.swift
//  GoalAnimation
//
//  Created by Alok Sagar on 04/03/22.
//

import SwiftUI

struct ContentView: View {
    @State var text = ""
    @State var showL = false
    @State var kickBall = false
    @State var lRotationAngle = 0.0
    @State var ballOffsetY = UIScreen.main.bounds.height * -1
    @State var ballOffsetX = 2.0
    @State var showGoalPost = false
    @State var startBallAnimation = false
    @State var startAnimation = false
    
    var screenWidth = UIScreen.main.bounds.width
    var screenHeight = UIScreen.main.bounds.height
    let ballBuncingAnimation = Animation.interpolatingSpring(stiffness: 200, damping: 10)
    
    var body: some View {
        ZStack {
            GoalPostView().offset(x: 0, y:0).opacity(showGoalPost ? 1 : 0)
                
                VStack{
                  
                    HStack(spacing:0) {
                        
                        Text(text).font(.custom("Poppins-Bold", size: 55)).foregroundColor(.white)
                        if showL {
                            Text("L").font(.custom("Poppins-Bold", size: 55)).animation(.spring()).rotationEffect(.degrees(lRotationAngle)).foregroundColor(.white)
                        }
                        if startBallAnimation {
                            if !kickBall {
                                Image("football").resizable().frame(width: 40, height:40).frame(width: 40, height: 40).offset( x:ballOffsetX,y: ballOffsetY).animation(ballBuncingAnimation).animation(.easeInOut.delay(1.6),value: ballOffsetY)
                            } else {
                                Image("football").resizable().frame(width: 40, height:40).frame(width: 40, height: 40).offset( x:ballOffsetX,y: ballOffsetY)
                            }

                        }
                        
                    }.padding(0)
                    
                }.onAppear {
                    startBallAnimation = true
                    for (index,letter) in "GOA".enumerated() {
                        withAnimation (.easeInOut.delay(Double(index)*0.2)){
                            print("Show\(letter) ")
                            text.append(letter)
                        }
                    }
                    withAnimation (.easeInOut.delay(0.6)){
                        print("Show L ")
                        showL = true
                    }
                    
                    withAnimation (.easeInOut.delay(0.6)){
                        print("Show L ")
                        showL = true
                    }
                    
                    withAnimation (.easeInOut.delay(0.7)){
                        print("Show L ")
                
                        ballOffsetY = 0
                    }
                    
                    withAnimation (.easeInOut.delay(1)){
                        print("Kick L ")
                       lRotationAngle = -45
                        kickBall = true
                       
                    }
                    
                    withAnimation (.easeInOut(duration: 1).delay(1.2)){
                        print("Kick L ")
                        ballOffsetY = -screenHeight
                        ballOffsetX = screenWidth*2
                    }
                    
                    withAnimation (.easeInOut(duration: 1).delay(1.9)){
                        print("restore L ")
                        lRotationAngle = 0
                        startBallAnimation = false
                       
                    }
                    
                }
            //}
        }.frame(width: screenWidth, height: screenHeight, alignment: .center).background(.black)
            .onAppear {
                
                withAnimation(.easeInOut(duration: 0.7).delay(1.7)) {
                
                    showGoalPost = true
                }
        }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct GoalPostView: View {
    var fillColor:Color = .white
    var body: some View {
        ZStack {
            Rectangle().frame(width: 10, height: 76, alignment: .center).foregroundColor(fillColor).offset(x: -100, y: -16)
            Rectangle().frame(width: 10, height: 76, alignment: .center).foregroundColor(fillColor).offset(x: 100, y: -16)
            
            Rectangle().frame(width: 210, height: 10, alignment: .center).foregroundColor(fillColor).offset(x: 0, y: -59)
        }
    }
}
