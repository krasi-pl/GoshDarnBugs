//
//  FB6863188.swift
//  GoshDarnBugs
//
//  Created by blaszm01 on 13/08/2019.
//  Copyright © 2019 Mariusz Blaszczyk. All rights reserved.
//

import Foundation
import SwiftUI


struct FB6863188: BugDemonstrationView {
  
  let colors:[Color] = [
    .red,
    .orange,
    .yellow,
    .green,
    .blue,
    .purple
  ]
  
  func cellForItemAt(_ index: Int) -> some View {
    return
      NavigationLink(destination: ContentView()) {
        VStack{
          Rectangle()
            .foregroundColor(colors[index])
            .frame(width: 80, height: 40)
          Text("Single navigation link does not work")
            .font(.callout)
        }.frame(width: 80)
      }.buttonStyle(PlainButtonStyle())
  }
  
  var body: some View {
    
    
    VStack { //without wrapping inside VStack, NavigationLink does not work
      
      List {
        VStack() {
          Text ("Tap here to open all Navigation Links") // tap here to push set of ConentViews
          ScrollView(.horizontal) {
            HStack {
              ForEach ( 0 ..< colors.count) { index in
                self.cellForItemAt(index)
              }
            }
          }
        }
      }
      
      
    }
  }
}
