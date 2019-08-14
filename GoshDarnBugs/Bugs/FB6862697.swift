//
//  FB6862697.swift
//  GoshDarnBugs
//
//  Created by blaszm01 on 13/08/2019.
//  Copyright © 2019 Vatsal Manot. All rights reserved.
//

import Foundation
import SwiftUI

struct FB6862697: BugDemonstrationView {
  
  var body: some View {
    ZStack {
      Color(.green)        
      Text("Lack of background hehind status bar, despite .edgesIgnoringSafeArea\nOccurs only when using tab bar ")
    }
    .edgesIgnoringSafeArea(.all)
    .navigationBarTitle("FB6862697")
  }
}
