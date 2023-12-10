import Architecture
import LinkNavigator

struct MovieHomeRouteBuilder<RootNavigator: RootNavigatorType> {
  static func generate() -> RouteBuilderOf<RootNavigator> {
    let matchPath = Link.Movie.Path.movieHome.rawValue
    
    return .init(matchPath: matchPath) { navigator, item, diContainer -> RouteViewController? in
      guard let env: MovieEnvironmentUseable = diContainer.resolve() else { return .none }
      
      return DebugWrappingController(matchPath: matchPath) {
        MovieHomePage(store: .init(
          initialState: MovieHomeStore.State(),
          reducer: {
            MovieHomeStore(env: MovieHomeEnvLive(
              useCaseGroup: env,
              navigator: navigator))
          }))
      }
    }
  }
}
