//
//  FB6588325.swift
//  GoshDarnBugs
//
//  Created by Matthew Waller on 8/13/19.
//  Copyright © 2019 Vatsal Manot. All rights reserved.
//

import SwiftUI

struct FB6588325: BugDemonstrationView {
    @State var showSheet = false
    var body: some View {
        Button(action: {
            self.showSheet = true
        }) {
            Text("Show Action Sheet")
        }
        .actionSheet(isPresented: $showSheet) {
            ActionSheet(title: Text("Action Sheet"),
                        message: Text("This is only a problem on iPad or Mac"),
                        buttons: [ActionSheet.Button.cancel(),
                                  ActionSheet.Button.default(Text("Action Here"), action: {
                                    print("Thing done")
                                })]
            )
        }
    }
}
