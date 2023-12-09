import Architecture
import LinkNavigator

struct DiscoverRouteBuilder<RootNavigator: RootNavigatorType> {
  static func generate() -> RouteBuilderOf<RootNavigator> {
    let matchPath = Link.Movie.Path.discover.rawValue
    
    return .init(matchPath: matchPath) { navigator, item, diContainer -> RouteViewController? in
      guard let env: MovieEnvironmentUseable = diContainer.resolve() else { return .none }
      
      return DebugWrappingController(matchPath: matchPath) {
        DiscoverPage(store: .init(
          initialState: DiscoverStore.State(), 
          reducer: {
            DiscoverStore(env: DiscoverEnvLive(useCaseGroup: env))
          }))
      }
    }
  }
}
