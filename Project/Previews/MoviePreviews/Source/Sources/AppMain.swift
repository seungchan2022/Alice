import SwiftUI
import Architecture
import LinkNavigator

@main
struct AppMain: App {

  @State private var viewModel = AppMainViewModel()
  
  var body: some Scene {
    WindowGroup {
      LinkNavigationView(
        linkNavigator: viewModel.linkNavigator,
        item: .init(path: Link.Movie.Path.discover.rawValue))
      .ignoresSafeArea()
    }
  }
}
