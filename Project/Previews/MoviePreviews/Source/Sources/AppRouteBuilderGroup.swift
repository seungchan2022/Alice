import Architecture
import Foundation
import LinkNavigator
import Movie

struct AppRouteBuilderGroup<RootNavigator: LinkNavigatorFindLocationUsable & LinkNavigatorProtocol> {
  public var release: [RouteBuilderOf<RootNavigator>] {
    MovieRouteBuilderGroup.release
  }
}
