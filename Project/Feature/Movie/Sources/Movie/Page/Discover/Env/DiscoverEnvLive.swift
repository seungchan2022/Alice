import Foundation
import Architecture
import ComposableArchitecture
import Domain
import LinkNavigator

struct DiscoverEnvLive {
  let useCaseGroup: MovieEnvironmentUseable
  let mainQueue: AnySchedulerOf<DispatchQueue> = .main
}

extension DiscoverEnvLive: DiscoverEnvType { }
