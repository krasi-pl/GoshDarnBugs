//
//  SolvedBugsList.swift
//  GoshDarnBugs
//
//  Created by blaszm01 on 14/08/2019.
//  Copyright © 2019 Vatsal Manot. All rights reserved.
//

import SwiftUI

struct SolvedBugsList: View {
    let demonstrations: [BugDemonstration] = [
    ]

    var body: some View {
        NavigationView {
            List(demonstrations) { demonstration in
                NavigationLink(destination: demonstration.makeView()) {
                    Text(demonstration.name)
                }
            }
            .navigationBarTitle("Bugs No More")
        }
    }
}

#if DEBUG
struct SolvedBugsList_Previews: PreviewProvider {
    static var previews: some View {
        SolvedBugsList()
    }
}
#endif
