import Foundation
import ComposableArchitecture
import Domain

protocol MovieHomeEnvType {
  var useCaseGroup: MovieEnvironmentUseable { get }
  var mainQueue: AnySchedulerOf<DispatchQueue> { get }
}

extension MovieHomeEnvType {
  
}
