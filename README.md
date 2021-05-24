# SwiftUINavigationBarStyling

Style a navigation bar in SwiftUI - changing its **background color, text color, as well as styling the status bar**. The end result looks like this:

![in action](https://swiftuirecipes.com/user/pages/01.blog/navigation-bar-styling-in-swiftui/Screenshot%202020-11-03%20at%2009.26.43.png)

### Recipe

Check out [this recipe](https://swiftuirecipes.com/blog/navigation-bar-styling-in-swiftui) for in-depth description of the component and its code. Check out [SwiftUIRecipes.com](https://swiftuirecipes.com) for more **SwiftUI recipes**!

### Sample usage

Changing navigation bar background and text color:

```swift
var body: some View {
  NavigationView {
    VStack {
      Text("Hello World!")
    }.navigationBarColor(.blue, textColor: .white) // HERE
  }
}
```

Changing status bar style - in your **SceneDelegate.swift**, replace `UIHostingController` with `StyledHostingController`:

```swift
if let windowScene = scene as? UIWindowScene {
  let window = UIWindow(windowScene: windowScene)
  window.rootViewController = StyledHostingController(statusBarStyle: .lightContent, rootView: contentView) // HERE
  self.window = window
  window.makeKeyAndVisible()
}
```

### Installation

This component is distrubuted as a **Swift package**. 

