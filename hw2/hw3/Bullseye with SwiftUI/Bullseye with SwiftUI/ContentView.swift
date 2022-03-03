//
//  ContentView.swift
//  Bullseye with SwiftUI
//
//  Created by Chae Won Yun on 2/28/22.
//

import SwiftUI

struct ContentView: View {
    @State var SliderValue: Double = 50
    @State var showDetails = false
    @State var toggle = true
    
    
    var body: some View {
        VStack() {
            HStack() {
                VStack() {
                    Text("High Score")
                    Text("0")
                }
                .padding(.leading, 20)
                .padding(.top, 20)
                .padding(.bottom, 35)
                
                Spacer()
                
                VStack() {
                    Text("Current Level")
                    Text("1")
                }
                .padding(.trailing, 15)
                .padding(.top, 20)
                .padding(.bottom, 35)
            }
            
            Spacer()
     
            //your code here
            //text element for "Move the slider to:"
            Text("Move the slider to:")
                .font(.system(size: 30))
            //text element for "25"
            Text("25")
                .font(.system(size: 30))
            //slider element
            Slider(value: $SliderValue, in: 0...100)
                .padding(.trailing, 15)
                .padding(.leading, 15)
            //button element for "Check"
            Button("Check"){
                showDetails.toggle()
            }
                .padding(.bottom, 300)
            //text element for "Exact Mode?"
            Text("Exact Mode?")
            //toggle element
            Toggle("Exact Mode",
                   isOn: $toggle).labelsHidden()
            }
        }
    }
