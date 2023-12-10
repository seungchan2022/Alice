import Architecture
import LinkNavigator

public struct MovieRouteBuilderGroup<RootNavigator: RootNavigatorType> {
  
  public init() { }
}

extension MovieRouteBuilderGroup {
  public static var release: [RouteBuilderOf<RootNavigator>] {
    [
      MovieHomeRouteBuilder.generate(),
      MovieDetailRouteBuilder.generate(),
      DiscoverRouteBuilder.generate(),
      FanClubRouteBuilder.generate(),
      MyListRouteBuilder.generate(),
    ]
  }
}
