import Foundation
import Architecture
import ComposableArchitecture
import Domain
import LinkNavigator

struct MyListEnvLive {
  let useCaseGroup: MovieEnvironmentUseable
  let mainQueue: AnySchedulerOf<DispatchQueue> = .main
  let navigator: RootNavigatorType
}

extension MyListEnvLive: MyListEnvType {
  var routeToTabItem: (String) -> Void {
    { path in
      guard path != Link.Movie.Path.myList.rawValue  else { return }
      navigator.replace(linkItem: .init(path: path), isAnimated: false)
    }
  }
}


