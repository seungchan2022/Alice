import Foundation
import ComposableArchitecture
import Domain

protocol MovieDetailEnvType {
  var useCaseGroup: MovieEnvironmentUseable { get }
  var mainQueue: AnySchedulerOf<DispatchQueue> { get }
  
  var routeToBack: () -> Void { get }
}

extension MovieDetailEnvType { }
