import Architecture
import Foundation
import LinkNavigator
import Movie

struct AppRouteBuilderGroup<RootNavigator: RootNavigatorType> {
  public var release: [RouteBuilderOf<RootNavigator>] {
    MovieRouteBuilderGroup.release
  }
}
