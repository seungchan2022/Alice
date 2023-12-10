import Foundation
import Architecture
import ComposableArchitecture
import Domain
import LinkNavigator

struct FanClubEnvLive {
  let useCaseGroup: MovieEnvironmentUseable
  let mainQueue: AnySchedulerOf<DispatchQueue> = .main
  let navigator: RootNavigatorType
}

extension FanClubEnvLive: FanClubEnvType {
  var routeToTabItem: (String) -> Void {
    { path in
      guard path != Link.Movie.Path.fanClub.rawValue else { return }
      navigator.replace(linkItem: .init(path: path), isAnimated: false)
    }
  }
}

