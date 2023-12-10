import Foundation
import ComposableArchitecture
import Domain

protocol MovieHomeEnvType {
  var useCaseGroup: MovieEnvironmentUseable { get }
  var mainQueue: AnySchedulerOf<DispatchQueue> { get }
  
  var routeToMovieDetail: () -> Void { get }
  
  var routeToTabItem: (String) -> Void { get }
}

extension MovieHomeEnvType { }
