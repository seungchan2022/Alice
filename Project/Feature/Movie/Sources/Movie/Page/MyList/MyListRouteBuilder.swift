import Architecture
import LinkNavigator

struct MyListRouteBuilder<RootNavigator: RootNavigatorType> {
  static func generate() -> RouteBuilderOf<RootNavigator> {
    let matchPath = Link.Movie.Path.myList.rawValue
    
    return .init(matchPath: matchPath) { navigator, item, diContainer -> RouteViewController? in
      guard let env: MovieEnvironmentUseable = diContainer.resolve() else { return .none }
      
      return DebugWrappingController(matchPath: matchPath) {
        MyListPage(store: .init(
          initialState: MyListStore.State(),
          reducer: {
            MyListStore(env: MyListEnvLive(useCaseGroup: env))
          }))
      }
    }
  }
}

