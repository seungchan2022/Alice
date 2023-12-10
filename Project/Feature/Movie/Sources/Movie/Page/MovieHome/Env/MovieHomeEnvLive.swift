import Architecture
import ComposableArchitecture
import Domain
import Foundation
import LinkNavigator

struct MovieHomeEnvLive {
  let useCaseGroup: MovieEnvironmentUseable
  let mainQueue: AnySchedulerOf<DispatchQueue> = .main
  let navigator: RootNavigatorType
}

extension MovieHomeEnvLive: MovieHomeEnvType {
  var routeToMovieDetail: () -> Void {
    {
      navigator.backOrNext(
        linkItem: .init(
          path: Link.Movie.Path.movieDetail.rawValue,
          items: ""),
        isAnimated: true)
    }
  }
  
  
  var routeToTabItem: (String) -> Void {
    { path in
      guard path != Link.Movie.Path.movieHome.rawValue else { return }
      navigator.replace(linkItem: .init(path: path), isAnimated: false)
    }
  }
}
