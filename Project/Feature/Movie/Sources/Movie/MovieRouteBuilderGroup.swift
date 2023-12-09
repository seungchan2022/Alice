import Architecture
import LinkNavigator

public struct MovieRouteBuilderGroup<RootNavigator: LinkNavigatorFindLocationUsable & LinkNavigatorProtocol> {
  
  public init() { }
}

extension MovieRouteBuilderGroup {
  public static var release: [RouteBuilderOf<RootNavigator>] {
    [
      TestRouteBuilder.generate(),
    ]
  }
}
