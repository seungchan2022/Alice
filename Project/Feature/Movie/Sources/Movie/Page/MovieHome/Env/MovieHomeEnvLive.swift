import Architecture
import ComposableArchitecture
import Domain
import Foundation
import LinkNavigator

struct MovieHomeEnvLive {
  let useCaseGroup: MovieEnvironmentUseable
  let mainQueue: AnySchedulerOf<DispatchQueue> = .main
}

extension MovieHomeEnvLive: MovieHomeEnvType { }
