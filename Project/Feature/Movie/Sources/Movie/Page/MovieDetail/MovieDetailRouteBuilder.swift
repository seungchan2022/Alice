import Architecture
import LinkNavigator

struct MovieDetailRouteBuilder<RootNavigator: RootNavigatorType> {
  static func generate() -> RouteBuilderOf<RootNavigator> {
    let matchPath = Link.Movie.Path.movieDetail.rawValue
    
    return .init(matchPath: matchPath) { navigator, item, diContainer -> RouteViewController? in
      guard let env: MovieEnvironmentUseable = diContainer.resolve() else { return .none }
      
      return DebugWrappingController(matchPath: matchPath) {
        MovieDetailPage(store: .init(
          initialState: MovieDetailStore.State(), 
          reducer: {
            MovieDetailStore(env: MovieDetailEnvLive(
              useCaseGroup: env,
              navigator: navigator))
          }))
      }
    }
  }
}
