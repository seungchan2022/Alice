import Architecture
import LinkNavigator

struct FanClubRouteBuilder<RootNavigator: RootNavigatorType> {
  static func generate() -> RouteBuilderOf<RootNavigator> {
    let matchPath = Link.Movie.Path.fanClub.rawValue
    
    return .init(matchPath: matchPath) { navigator, item, diContainer -> RouteViewController? in
      guard let env: MovieEnvironmentUseable = diContainer.resolve() else { return .none }
      
      return DebugWrappingController(matchPath: matchPath) {
        FanClubPage(store: .init(
          initialState: FanClubStore.State(),
          reducer: {
            FanClubStore(env: FanClubEnvLive(
              useCaseGroup: env,
              navigator: navigator))
          }))
      }
    }
  }
}

