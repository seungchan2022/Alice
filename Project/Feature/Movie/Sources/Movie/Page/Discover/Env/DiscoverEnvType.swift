import Foundation
import ComposableArchitecture
import Domain

protocol DiscoverEnvType {
  var useCaseGroup: MovieEnvironmentUseable { get }
  var mainQueue: AnySchedulerOf<DispatchQueue> { get }
}

extension DiscoverEnvType { }
