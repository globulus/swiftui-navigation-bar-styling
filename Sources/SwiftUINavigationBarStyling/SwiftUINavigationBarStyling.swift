import SwiftUI
import UIKit

public struct NavigationBarColorModifier: ViewModifier {
  var backgroundColor: UIColor
  var textColor: UIColor

  public init(backgroundColor: UIColor, textColor: UIColor) {
    self.backgroundColor = backgroundColor
    self.textColor = textColor
    let coloredAppearance = UINavigationBarAppearance()
    coloredAppearance.configureWithTransparentBackground()
    coloredAppearance.backgroundColor = .clear
    coloredAppearance.titleTextAttributes = [.foregroundColor: textColor]
    coloredAppearance.largeTitleTextAttributes = [.foregroundColor: textColor]

    UINavigationBar.appearance().standardAppearance = coloredAppearance
    UINavigationBar.appearance().compactAppearance = coloredAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    UINavigationBar.appearance().tintColor = textColor
  }

  public func body(content: Content) -> some View {
    ZStack {
       content
        VStack {
          GeometryReader { geometry in
             Color(self.backgroundColor)
                .frame(height: geometry.safeAreaInsets.top)
                .edgesIgnoringSafeArea([.top, .horizontal])
              Spacer()
          }
        }
     }
  }
}

public extension View {
  func navigationBarColor(_ backgroundColor: UIColor, textColor: UIColor) -> some View {
    self.modifier(NavigationBarColorModifier(backgroundColor: backgroundColor, textColor: textColor))
  }
}

public class StyledHostingController<Content> : UIHostingController<Content> where Content : View {
    private var statusBarStyle: UIStatusBarStyle?
    
    public init(statusBarStyle: UIStatusBarStyle, rootView: Content) {
        self.statusBarStyle = statusBarStyle
        super.init(rootView: rootView)
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
  @objc override dynamic open var preferredStatusBarStyle: UIStatusBarStyle {
    return statusBarStyle ?? .default
  }
}
