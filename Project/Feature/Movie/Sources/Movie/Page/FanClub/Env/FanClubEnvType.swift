import Foundation
import ComposableArchitecture
import Domain

protocol FanClubEnvType {
  var useCaseGroup: MovieEnvironmentUseable { get }
  var mainQueue: AnySchedulerOf<DispatchQueue> { get }
}

extension FanClubEnvType { }

