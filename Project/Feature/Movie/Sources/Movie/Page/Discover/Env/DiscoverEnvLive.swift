import Foundation
import Architecture
import ComposableArchitecture
import Domain
import LinkNavigator

struct DiscoverEnvLive {
  let useCaseGroup: MovieEnvironmentUseable
  let mainQueue: AnySchedulerOf<DispatchQueue> = .main
  let navigator: RootNavigatorType
}

extension DiscoverEnvLive: DiscoverEnvType { 
  var routeToTabItem: (String) -> Void {
    { path in
      guard path != Link.Movie.Path.discover.rawValue else { return }
      navigator.replace(linkItem: .init(path: path), isAnimated: false)
    }
  }
}
