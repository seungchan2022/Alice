import Foundation
import Architecture
import Domain
import ComposableArchitecture
import LinkNavigator

struct MovieDetailEnvLive {
  let useCaseGroup: MovieEnvironmentUseable
  let mainQueue: AnySchedulerOf<DispatchQueue> = .main
  let navigator: RootNavigatorType
}

extension MovieDetailEnvLive: MovieDetailEnvType { 
  var routeToBack: () -> Void {
    {
      navigator.back(isAnimated: true)
    }
  }
}
