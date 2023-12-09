import Architecture
import LinkNavigator

struct TestRouteBuilder<RootNavigator: LinkNavigatorFindLocationUsable & LinkNavigatorProtocol> {
  static func generate() -> RouteBuilderOf<RootNavigator> {
    let matchPath = "test"
    
    return .init(matchPath: matchPath) { navigator, item, diContainer -> RouteViewController? in
      guard let env: MovieEnvironmentUseable = diContainer.resolve() else { return .none }
      
      return DebugWrappingController(matchPath: matchPath) {
        TestPage(store: .init(
          initialState: TestStore.State(),
          reducer: {
            TestStore(env: TestEnvLive(useCaseGroup: env))
          }))
      }
    }
  }
}
