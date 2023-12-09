import ComposableArchitecture
import Domain
import Foundation

protocol TestEnvType {
  var useCaseGroup: MovieEnvironmentUseable { get }
  var mainQueue: AnySchedulerOf<DispatchQueue> { get }
}

extension TestEnvType {
}
