# Gosh Darn Bugs!

GoshDarnBugs is a collection of... you guessed it, bugs.

## Why?

SwiftUI is an absolutely fantastic framework, a culmination of several years' worth of effort by many, many amazing and talented Apple engineers. Being a radical departure from traditional Cocoa/Touch frameworks, it is quite nascent and (understandably) still finding stability in terms of API design and an overall bug-free experience. 

Working with SwiftUI feels like standing on the bleeding edge. It's a new, beautiful, inspired way of writing code - and feels like a clean slate in terms of typical usage and best practices. A lot of us are trying to find our footing within this new framework, and there is certainly a lot confusing. However, it is sometimes frustrating to find that what *seems* confusing and misunderstood may simply belie a bug in the beta.

While SwiftUIX attempts to fill the gaps of SwiftUI in terms of available APIs, GoshDarnBugs attempts to offer an exhaustive, demonstrable collection of SwiftUI bugs in the latest beta. This is done in the hope of serving as a useful, centralized point of reference for all those experimenting/building with SwiftUI.

## Contributing

GoshDarnBugs as a project is only as useful as its strength in contributors, and thus is designed to be painless to contribute to.

The prerequisites are as follows: 

- A Feedback Assistant number for your bug report (please, please, please file bug reports!).
- A `View` demonstrating your bug, that can be initialized simply using `.init()`.

The steps to contribute are as follows: 

- Create a Swift file with your feedback number as the name, and put it in the `Bugs` folder.
- Create a `View` named after your feedback number (in the form of `FBXXXXXXX`), and add a conformance to `BugDemonstrationView` .
- Navigate to `ContentView.swift`, and add `.init(FBXXXXXXX.self)` to the `demonstrations: [BugDemonstration]` property. 

That's basically it. 

In case you're wondering what `BugDemonstrationView` and `BugDemonstration` are:

```swift
/// A view that represents the demonstration of some bug.
protocol BugDemonstrationView: View {
    init()
}

/// A type that represents the demonstration of some bug.
final class BugDemonstration: Identifiable {
    public let name: String
    public let makeView: () -> AnyView

    init<View: BugDemonstrationView>(_ viewType: View.Type) {
        self.name = String(describing: viewType)
        self.makeView = { AnyView(View()) }
    }
}
```

They're just simple utilities that allow for `ContentView`'s body, like so:

```swift
    var body: some View {
        NavigationView {
            List(demonstrations) { demonstration in
                NavigationLink(destination: demonstration.makeView()) {
                    Text(demonstration.name)
                }
            }
            .navigationBarTitle("Gosh Darn Bugs!")
        }
    }
```

Dynamically creating a navigatable list of all available bug demonstrations.