import Domain
import Foundation
import LinkNavigator
import Movie

@Observable
final class AppMainViewModel {

  let linkNavigator: SingleLinkNavigator
  
  init() { 
    linkNavigator = .init(
      routeBuilderItemList: AppRouteBuilderGroup().release,
      dependency: AppSideEffect.build())
  }
}
