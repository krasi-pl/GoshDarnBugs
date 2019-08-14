//
//  Home.swift
//  GoshDarnBugs
//
//  Created by blaszm01 on 14/08/2019.
//  Copyright © 2019 Vatsal Manot. All rights reserved.
//

import SwiftUI

struct Home: View {
  @State var selectedTab: Int = 0
  
  var body: some View {
    TabView(selection: $selectedTab) {
      OpenBugsList().tabItem { Text("Open bugs")}.tag(0)
      SolvedBugsList().tabItem { Text("Solved")}.tag(1)
    }
  }
}

#if DEBUG
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
#endif
